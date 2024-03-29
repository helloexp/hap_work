/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : hap_dev

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-06-18 11:58:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'false', '1');
INSERT INTO `act_ge_property` VALUES ('next.dbid', '2501', '2');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.0.0.3)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.0.0.3', '1');

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-1', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:04', '1', 'EXECUTED', '7:9cac9c56da25e14795c9ad0fa1436c19', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-2', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:05', '2', 'EXECUTED', '7:5d560b358c03c9fee1a39da807b02b23', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-3', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:05', '3', 'EXECUTED', '7:9e2fe3457ff81d91b48b534a6459aaa0', 'createTable, addUniqueConstraint, createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-4', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:05', '4', 'EXECUTED', '7:551f342eb60fdf566c4d95a61b161363', 'createTable, createIndex, createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-5', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:05', '5', 'EXECUTED', '7:7d29d8abcefb7bb07043a9897e31d08d', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-6', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:05', '6', 'EXECUTED', '7:425119fea37700db89b302ec51f02a00', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-7', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:05', '7', 'EXECUTED', '7:141374b97762ca54b459b60beba2c040', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-8', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:05', '8', 'EXECUTED', '7:9a674f57a67ab46523528c8447b31202', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-9', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:06', '9', 'EXECUTED', '7:9f83aa6e28d4f23ee298b99802076e7d', 'createTable, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-10', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:06', '10', 'EXECUTED', '7:cbc692f7425bc6701f2c567fe508b542', 'createTable, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-11', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:06', '11', 'EXECUTED', '7:4d8043535ee793e9409b1fea6b934289', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-12', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:06', '12', 'EXECUTED', '7:f6ece7f4163ef166c20a2f42424dd9e2', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-13', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:06', '13', 'EXECUTED', '7:a49ef97998b9acf74e22cb3a066b8743', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-14', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:06', '14', 'EXECUTED', '7:616e4f25d42a9d13f7259fb497395d3e', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-15', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:06', '15', 'EXECUTED', '7:d84b793422dc1ae60a6ef833796ca8ec', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-16', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:07', '16', 'EXECUTED', '7:7b692fe998f27eb0d4c8992ad8fe98d1', 'createTable, addUniqueConstraint, createIndex, createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-17', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:07', '17', 'EXECUTED', '7:113d335667c184c47f7f0e7650eb87e2', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-18', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:07', '18', 'EXECUTED', '7:f9e230001744d362be869c79e52d913b', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-19', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:07', '19', 'EXECUTED', '7:e5283c602c58c0c70ba7c286eae45df7', 'createTable, addUniqueConstraint, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-20', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:07', '20', 'EXECUTED', '7:31098a41b812119f3dd5ee3322670659', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-21', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:07', '21', 'EXECUTED', '7:b32904539b879705d32f2ad4a434ff01', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160610-sys-attach-category-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:07', '22', 'EXECUTED', '7:999c5a29fe71bd6a72a54d87537e753e', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160610-sys-attachment-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:08', '23', 'EXECUTED', '7:3de8de4f612baa8c57693dfa20d4dac5', 'createTable, createIndex (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160610-sys-file-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:08', '24', 'EXECUTED', '7:cba72ad08c077065381aa2a6fe368c62', 'createTable, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-transaction-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:08', '25', 'EXECUTED', '7:8687ecbd4890bfac4be5c8c847dc2478', 'createTable, createIndex (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-attachment-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:08', '26', 'EXECUTED', '7:5705fdfba5272a56d655a1bffe282801', 'createTable, createIndex (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-email-account-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:08', '27', 'EXECUTED', '7:c96d61576e45aac0862c5219c491d42c', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-email-config-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:08', '28', 'EXECUTED', '7:bb29c2927842699262131ba2f1dd60bc', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-message-email-white-lt-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:08', '29', 'EXECUTED', '7:d935ef8ebd2bb4867f2de5e8b1cd4a70', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-message-receiver-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:08', '30', 'EXECUTED', '7:a19fcaa3839cf5d58c5a517c4a6d716f', 'createTable, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-message-template-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:09', '31', 'EXECUTED', '7:30d17456a88542cd03ca7c4ebafe28a8', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-preferences-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:09', '32', 'EXECUTED', '7:86dba2866476bb547c66f1a1dca40caa', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-account-retrieve-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:09', '33', 'EXECUTED', '7:b85978e55ee07971e98e327946d2eff2', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160922-sys-config-1', 'xuhailin', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:09', '34', 'EXECUTED', '7:9a086e0e95e6567eda7bd6dbc803318a', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-activiti.create.engine-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:18', '35', 'EXECUTED', '7:db6e32a91292af7bd67a1b554392e055', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-activiti.create.history-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:19', '36', 'EXECUTED', '7:5eb0e316ceac016258fe1a8796c5a04b', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-activiti.create.identity-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:19', '37', 'EXECUTED', '7:d9ba093bbd73a17a565e45a0a3b1b1dc', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('2016-10-9-FND_COMPANY', 'jialongzuo', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:20', '38', 'EXECUTED', '7:5ae91b53baf9301cc0b53cd33913c0f5', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161011-sys-userLogin-1', 'jialongzuo', '2016-06-09-init-table-migration.groovy', '2017-03-27 15:25:20', '39', 'EXECUTED', '7:4868890d35400bf73b6e6e3390e6cbb2', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-employee', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:20', '40', 'EXECUTED', '7:07c915a5d30d8d22125f508467d49556', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-org-unit', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:20', '41', 'EXECUTED', '7:fd02936bc948ab02489e94072e720030', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-org-position', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:20', '42', 'EXECUTED', '7:465365db4389d13a1203bac7735d3251', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-employee-assign', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:20', '43', 'EXECUTED', '7:d0b5a1ca504c1ef36fb410f41c830123', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161011-niujiaqing-sys-dashboard', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:20', '44', 'EXECUTED', '7:044b40288f4a9e51ce9f5f53ac14a23d', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161012-niujiaqing-user-dashboard', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:20', '45', 'EXECUTED', '7:15a304a37ab173818db363debca865c6', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161031-sys-interfaceHeader-1', 'xiangyuQi', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:21', '46', 'EXECUTED', '7:773b32780ba1136e5879eb3c733a1afb', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161031-sys-interfaceLine-1', 'xiangyuQi', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:21', '47', 'EXECUTED', '7:4a0f79c06570442fc3e392aff56adac3', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161117-sys-user-demo-1', 'xuhailin', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:21', '48', 'EXECUTED', '7:2631f516111601ec396aace8c0401d32', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161121-sys-if-invoke-in-1', 'xiangyuQi', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:21', '49', 'EXECUTED', '7:adf8895c0b6b018e26fa25ff2d9d0523', 'createTable, createIndex (x4)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161121-sys-if-invoke-out-1', 'xiangyuQi', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:21', '50', 'EXECUTED', '7:caf8f033968cd31f816dc46077f61d6a', 'createTable, createIndex (x4)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161212-sys-resource-customization-1', 'yangzhizheng', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:21', '51', 'EXECUTED', '7:ef9ec7483a44c224194b4ed716d5d0f6', 'createTable, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161218-wfl-approve-chain-header-1', 'jessen', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:22', '52', 'EXECUTED', '7:0b3e0dbc97e99e51cb0f860cd2fb4e86', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161218-wfl-approve-chain-line-1', 'jessen', '2016-09-26-init-migration.groovy', '2017-03-27 15:25:22', '53', 'EXECUTED', '7:f5631fd8729834990eaa374179b2cb5e', 'createTable, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160601-hailor-1', 'jessen', 'hbi/core/db/2016-06-01-init-migration.groovy', '2017-03-27 15:25:22', '54', 'EXECUTED', '7:db8c28b026c8937eb118a19768efa7c4', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161009-xiangyuqi-1', 'xiangyuqi', 'patch.groovy', '2017-03-27 15:25:22', '55', 'EXECUTED', '7:70978c14109fc229144487006afccf91', 'addColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161025-zhizheng.yang-1', 'zhizheng.yang', 'patch.groovy', '2017-03-27 15:25:22', '56', 'EXECUTED', '7:c514a1778adc006e19237dbaf9ac7b6f', 'addColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161104-zhizheng.yang', 'zhizheng.yang', 'patch.groovy', '2017-03-27 15:25:22', '57', 'EXECUTED', '7:d20c8a541f028fa8876bdb71fafa05f4', 'addColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161109-xiangyuqi-1', 'xiangyu.qi', 'patch.groovy', '2017-03-27 15:25:23', '58', 'EXECUTED', '7:e9c2e00a3a580cde9301e67bdaa86513', 'renameColumn, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161110-jialongzuo-1', 'jialong.zuo', 'patch.groovy', '2017-03-27 15:25:23', '59', 'EXECUTED', '7:164ccff8482ca92bc4c91622d34cf2da', 'addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161129-jialongzuo-1', 'jialong.zuo', 'patch.groovy', '2017-03-27 15:25:23', '60', 'EXECUTED', '7:91ca2128eff23ef5dc99b6f9ae7ffe41', 'addColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161221-xiangyuqi-1', 'xiangyuqi', 'patch.groovy', '2017-03-27 15:25:23', '61', 'EXECUTED', '7:0a2344235522714ca4fa2ac38aa99252', 'addColumn, addDefaultValue', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161221-yangzhizheng-1', 'zhizheng.yang', 'patch.groovy', '2017-03-27 15:25:23', '62', 'EXECUTED', '7:045cf6eda6d497a264a5a46858ae0bcc', 'addColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20170106-yangzhizheng-1', 'zhizhengyang', 'patch.groovy', '2017-03-27 15:25:23', '63', 'EXECUTED', '7:ec99d6d178e0cc399e8f92de0d91c8b6', 'addColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-attach-category-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-03-27 15:25:23', '64', 'EXECUTED', '7:d7254fb792a2581c0c921cda8b90698b', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-email-config-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-03-27 15:25:23', '65', 'EXECUTED', '7:c39e780093128f2d0aafed24b3109466', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-email-account-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-03-27 15:25:23', '66', 'EXECUTED', '7:763810fcf72218794f8e4258011bef88', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-email-white-lt-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-03-27 15:25:23', '67', 'EXECUTED', '7:f5032ab5d66464c5d77ca62f90ca05ad', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-template-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-03-27 15:25:23', '68', 'EXECUTED', '7:45cef023d3167bf5abed8b84d0c6ee8e', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160930-init-data-xlsx', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-04-10 14:45:51', '69', 'RERAN', '7:d489dcba0a89b6037081c88c56bff5ff', 'customChange', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160601-yourname-1', 'yourname', 'hbi/core/db/2016-06-01-init-data.groovy', '2017-03-27 15:25:30', '70', 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'Empty', '', null, '3.4.2', null, null);

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES ('1', '\0', null, null);

-- ----------------------------
-- Table structure for fnd_company_b
-- ----------------------------
DROP TABLE IF EXISTS `fnd_company_b`;
CREATE TABLE `fnd_company_b` (
  `company_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_code` varchar(30) NOT NULL COMMENT '公司编码',
  `company_type` varchar(30) DEFAULT NULL COMMENT '公司类型',
  `address` varchar(2000) DEFAULT NULL COMMENT '地址',
  `company_level_id` bigint(20) DEFAULT NULL,
  `parent_company_id` bigint(20) DEFAULT NULL,
  `chief_position_id` bigint(20) DEFAULT NULL,
  `start_date_active` datetime DEFAULT NULL,
  `end_date_active` datetime DEFAULT NULL,
  `company_short_name` varchar(2000) DEFAULT NULL COMMENT '公司简称',
  `company_full_name` varchar(2000) DEFAULT NULL COMMENT '公司全称',
  `zipcode` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `FND_COMPANY_B_U1` (`company_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fnd_company_b
-- ----------------------------

-- ----------------------------
-- Table structure for fnd_company_tl
-- ----------------------------
DROP TABLE IF EXISTS `fnd_company_tl`;
CREATE TABLE `fnd_company_tl` (
  `company_id` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `company_short_name` varchar(2000) DEFAULT NULL,
  `company_full_name` varchar(2000) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`company_id`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fnd_company_tl
-- ----------------------------

-- ----------------------------
-- Table structure for hap_ar_customers_b
-- ----------------------------
DROP TABLE IF EXISTS `hap_ar_customers_b`;
CREATE TABLE `hap_ar_customers_b` (
  `CUSTOMER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `CUSTOMER_NUMBER` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '客户编号',
  `CUSTOMER_NAME` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `COMPANY_ID` bigint(20) NOT NULL COMMENT '公司ID',
  `ENABLED_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '启用标识',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `OBJECT_VERSION_NUMBER` varchar(1) NOT NULL DEFAULT '1',
  `ATTRIBUTE_CATEGORY` varchar(255) DEFAULT NULL,
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `ATTRIBUTE1` varchar(255) DEFAULT NULL,
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `ATTRIBUTE2` varchar(255) DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) DEFAULT NULL,
  `ATTRIBUTE11` varchar(255) DEFAULT NULL,
  `ATTRIBUTE15` varchar(255) DEFAULT NULL,
  `ATTRIBUTE12` varchar(255) DEFAULT NULL,
  `ATTRIBUTE13` varchar(255) DEFAULT NULL,
  `ATTRIBUTE14` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COMMENT='客户主数据';

-- ----------------------------
-- Records of hap_ar_customers_b
-- ----------------------------
INSERT INTO `hap_ar_customers_b` VALUES ('201', 'C001', '上海达芙妮', '101', 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_ar_customers_b` VALUES ('202', 'C002', '光明乳业', '101', 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_ar_customers_b` VALUES ('203', 'C003', '东阿阿胶', '101', 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_ar_customers_b` VALUES ('204', 'C004', '大华科技', '101', 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_ar_customers_b` VALUES ('205', 'C005', '腾讯科技', '104', 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_ar_customers_tl
-- ----------------------------
DROP TABLE IF EXISTS `hap_ar_customers_tl`;
CREATE TABLE `hap_ar_customers_tl` (
  `CUSTOMER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LANG` varchar(255) NOT NULL,
  `CUSTOMER_NAME` varchar(240) DEFAULT NULL,
  `CREAYTED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT '2016-08-24 16:48:17' ON UPDATE CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT '2016-08-24 16:48:17' ON UPDATE CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `OBJECT_VERSION_NUMBER` varchar(1) NOT NULL DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`CUSTOMER_ID`,`LANG`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hap_ar_customers_tl
-- ----------------------------
INSERT INTO `hap_ar_customers_tl` VALUES ('201', 'en_GB', 'shanghaidafuni', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_ar_customers_tl` VALUES ('201', 'zh_CN', '上海达芙妮', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_ar_customers_tl` VALUES ('202', 'en_GB', 'guangmingruye', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_ar_customers_tl` VALUES ('202', 'zh_CN', '光明乳业', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_ar_customers_tl` VALUES ('203', 'en_GB', 'ajiao', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_ar_customers_tl` VALUES ('203', 'zh_CN', '东阿阿胶', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_ar_customers_tl` VALUES ('204', 'en_GB', 'dahuakeji', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_ar_customers_tl` VALUES ('204', 'zh_CN', '大华科技', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_ar_customers_tl` VALUES ('205', 'en_GB', 'tecentkeji', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_ar_customers_tl` VALUES ('205', 'zh_CN', '腾讯科技', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');

-- ----------------------------
-- Table structure for hap_demo
-- ----------------------------
DROP TABLE IF EXISTS `hap_demo`;
CREATE TABLE `hap_demo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `request_id` bigint(20) DEFAULT '-1',
  `program_id` bigint(20) DEFAULT '-1',
  `created_by` bigint(20) DEFAULT '-1',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update_login` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hap_demo
-- ----------------------------

-- ----------------------------
-- Table structure for hap_inv_inventory_items_b
-- ----------------------------
DROP TABLE IF EXISTS `hap_inv_inventory_items_b`;
CREATE TABLE `hap_inv_inventory_items_b` (
  `INVENTORY_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物料ID',
  `ITEM_CODE` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物料编码',
  `ITEM_UOM` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物料单位',
  `ITEM_DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物料描述',
  `ORDER_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '是否能用于销售',
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '生效起始时间',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '生效结束时间',
  `ENABLED_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '启用标识',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `OBJECT_VERSION_NUMBER` varchar(1) NOT NULL DEFAULT '1',
  `ATTRIBUTE_CATEGORY` varchar(255) DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) DEFAULT NULL,
  `ATTRIBUTE11` varchar(255) DEFAULT NULL,
  `ATTRIBUTE12` varchar(255) DEFAULT NULL,
  `ATTRIBUTE13` varchar(255) DEFAULT NULL,
  `ATTRIBUTE14` varchar(255) DEFAULT NULL,
  `ATTRIBUTE15` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`INVENTORY_ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8 COMMENT='物料主数据';

-- ----------------------------
-- Records of hap_inv_inventory_items_b
-- ----------------------------
INSERT INTO `hap_inv_inventory_items_b` VALUES ('1001', 'ITEM001', 'EA', 'HFM财务管理软件', 'Y', null, null, 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '-1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_inv_inventory_items_b` VALUES ('1002', 'ITEM002', 'EA', 'HWMS仓储管理系统', 'Y', null, null, 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '-1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_inv_inventory_items_b` VALUES ('1003', 'ITEM003', 'EA', 'HAP应用开发平台', 'N', null, null, 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '-1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_inv_inventory_items_b` VALUES ('1004', 'ITEM004', 'EA', 'HEC费用控制系统', 'Y', null, null, 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '-1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_inv_inventory_items_b` VALUES ('1005', 'ITEM005', 'EA', 'HFS财务共享系统', 'Y', '2016-10-01 00:00:00', null, 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '-1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_inv_inventory_items_tl
-- ----------------------------
DROP TABLE IF EXISTS `hap_inv_inventory_items_tl`;
CREATE TABLE `hap_inv_inventory_items_tl` (
  `INVENTORY_ITEM_ID` bigint(20) NOT NULL,
  `LANG` varchar(255) NOT NULL,
  `ITEM_DESCRIPTION` varchar(240) NOT NULL,
  `CREATION_DATE` datetime DEFAULT '2016-08-24 16:48:17' ON UPDATE CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT '2016-08-24 16:48:17' ON UPDATE CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `OBJECT_VERSION_NUMBER` varchar(1) NOT NULL DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`INVENTORY_ITEM_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hap_inv_inventory_items_tl
-- ----------------------------
INSERT INTO `hap_inv_inventory_items_tl` VALUES ('1001', 'en_GB', 'HFMguanxiruanjian', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_inv_inventory_items_tl` VALUES ('1001', 'zh_CN', 'HFM财务管理软件', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_inv_inventory_items_tl` VALUES ('1002', 'en_GB', 'HWMScangku', '2017-03-31 20:22:46', '-1', '-1', '2017-03-31 20:22:46', '-1', '1', '-1', '-1');
INSERT INTO `hap_inv_inventory_items_tl` VALUES ('1002', 'zh_CN', 'HWMS仓库管理系统', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_inv_inventory_items_tl` VALUES ('1003', 'en_GB', 'HAPkaifa', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_inv_inventory_items_tl` VALUES ('1003', 'zh_CN', 'HAP应用开发平台', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_inv_inventory_items_tl` VALUES ('1004', 'en_GB', 'HECfeiyong', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_inv_inventory_items_tl` VALUES ('1004', 'zh_CN', 'HEC费用控制系统', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_inv_inventory_items_tl` VALUES ('1005', 'en_GB', 'HFScaiwugongxiang', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_inv_inventory_items_tl` VALUES ('1005', 'zh_CN', 'HFS财务共享系统', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');

-- ----------------------------
-- Table structure for hap_om_order_headers_b
-- ----------------------------
DROP TABLE IF EXISTS `hap_om_order_headers_b`;
CREATE TABLE `hap_om_order_headers_b` (
  `HEADER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单头ID',
  `ORDER_NUMBER` varchar(60) NOT NULL COMMENT '订单编号',
  `COMPANY_ID` bigint(20) NOT NULL COMMENT '公司ID',
  `ORDER_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单日期',
  `ORDER_STATUS` varchar(30) NOT NULL COMMENT '订单状态',
  `CUSTOMER_ID` bigint(20) NOT NULL COMMENT '客户ID',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '请求号',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`HEADER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='销售订单头表';

-- ----------------------------
-- Records of hap_om_order_headers_b
-- ----------------------------
INSERT INTO `hap_om_order_headers_b` VALUES ('1', '用户订单', '101', '2017-04-02 21:13:10', '激活', '201', '1', '-1', '-1', '2017-04-02 21:13:10', '-1', '-1', '2017-04-02 21:13:10', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers_b` VALUES ('2', '商品订单', '102', '2017-04-02 21:15:49', '启用', '203', '1', '-1', '-1', '2017-04-02 21:15:49', '-1', '-1', '2017-04-02 21:15:49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers_b` VALUES ('3', '衣服订单', '101', '2017-04-02 21:16:17', '激活', '205', '1', '-1', '-1', '2017-04-02 21:16:17', '-1', '-1', '2017-04-02 21:16:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_om_order_headers_tl
-- ----------------------------
DROP TABLE IF EXISTS `hap_om_order_headers_tl`;
CREATE TABLE `hap_om_order_headers_tl` (
  `HEADER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LANG` varchar(255) NOT NULL,
  `ORDER_STATUS` varchar(30) NOT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGARM` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATED_BY` bigint(20) DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`HEADER_ID`,`ORDER_STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hap_om_order_headers_tl
-- ----------------------------
INSERT INTO `hap_om_order_headers_tl` VALUES ('1', 'zh_CN', 'active', '1', '-1', '-1', '2017-04-02 21:17:51', '-1', null, '2017-04-02 21:17:51', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers_tl` VALUES ('1', 'en_GB', '激活', '1', '-1', '-1', '2017-04-02 21:17:17', '-1', null, '2017-04-02 21:17:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers_tl` VALUES ('2', 'zh_CN', 'start', '1', '-1', '-1', '2017-04-02 21:21:21', '-1', null, '2017-04-02 21:21:21', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers_tl` VALUES ('2', 'en_GB', '启用', '1', '-1', '-1', '2017-04-02 21:18:10', '-1', null, '2017-04-02 21:18:10', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers_tl` VALUES ('3', 'zh_CN', 'active', '1', '-1', '-1', '2017-04-02 21:21:50', '-1', null, '2017-04-02 21:21:50', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers_tl` VALUES ('3', 'en_GB', '激活', '1', '-1', '-1', '2017-04-02 21:21:36', '-1', null, '2017-04-02 21:21:36', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_om_order_lines_b
-- ----------------------------
DROP TABLE IF EXISTS `hap_om_order_lines_b`;
CREATE TABLE `hap_om_order_lines_b` (
  `LINE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单行ID',
  `HEADER_ID` bigint(20) NOT NULL COMMENT '订单头ID',
  `LINE_NUMBER` bigint(20) NOT NULL COMMENT '行号',
  `INVENTORY_ITEM_ID` bigint(20) NOT NULL COMMENT '产品ID',
  `ORDERD_QUANTITY` bigint(20) NOT NULL COMMENT '数量',
  `ORDER_QUANTITY_UOM` varchar(30) NOT NULL COMMENT '产品单位',
  `UNIT_SELLING_PRICE` bigint(20) NOT NULL COMMENT '销售单价',
  `DESCRIPTION` varchar(240) NOT NULL COMMENT '备注',
  `COMPANY_ID` bigint(20) NOT NULL COMMENT '公司ID',
  `ADDITION1` varchar(150) DEFAULT NULL COMMENT '附加信息1',
  `ADDITION2` varchar(150) DEFAULT NULL COMMENT '附加信息2',
  `ADDITION3` varchar(150) DEFAULT NULL COMMENT '附加信息3',
  `ADDITION4` varchar(150) DEFAULT NULL COMMENT '附加信息4',
  `ADDITION5` varchar(150) DEFAULT NULL COMMENT '附加信息5',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '请求号',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LINE_ID`),
  KEY `HAP_OM_ORDER_LINES _N1` (`HEADER_ID`),
  KEY `HAP_OM_ORDER_LINES _N2` (`INVENTORY_ITEM_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='销售订单行表';

-- ----------------------------
-- Records of hap_om_order_lines_b
-- ----------------------------
INSERT INTO `hap_om_order_lines_b` VALUES ('11', '1', '1', '1001', '5', '上海汉得', '60', '生活用品', '101', null, null, null, null, null, '1', '-1', '-1', '2017-04-02 21:25:43', '-1', '-1', '2017-04-02 21:25:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_b` VALUES ('12', '2', '2', '1002', '6', '富平丈八', '70', '体育用品', '102', null, null, null, null, null, '1', '-1', '-1', '2017-04-02 21:27:17', '-1', '-1', '2017-04-02 21:27:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_b` VALUES ('13', '3', '3', '1001', '4', '陕西西安', '100', '洗簌用品', '101', null, null, null, null, null, '1', '-1', '-1', '2017-04-02 21:28:27', '-1', '-1', '2017-04-02 21:28:27', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_b` VALUES ('14', '1', '4', '1001', '6', '富平丈八', '63', '体育用品', '101', null, null, null, null, null, '1', '-1', '-1', '2017-04-07 13:16:30', '-1', '-1', '2017-04-07 13:16:30', '4', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_b` VALUES ('15', '1', '1', '1001', '1', '1', '1', '1', '101', null, null, null, null, null, '1', '-1', '-1', '2017-04-10 16:26:38', '-1', '-1', '2017-04-10 16:26:38', '4', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_b` VALUES ('16', '1', '2', '1001', '2', '2', '1232', '1', '101', null, null, null, null, null, '1', '-1', '-1', '2017-04-10 16:27:03', '-1', '-1', '2017-04-10 16:27:03', '4', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_om_order_lines_tl
-- ----------------------------
DROP TABLE IF EXISTS `hap_om_order_lines_tl`;
CREATE TABLE `hap_om_order_lines_tl` (
  `LINE_ID` bigint(20) NOT NULL,
  `LANG` varchar(255) NOT NULL,
  `ORDER_QUANTITY_UOM` varchar(30) NOT NULL,
  `DESCRIPTION` varchar(240) NOT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '1',
  `PROGARM_ID` bigint(20) DEFAULT '1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LINE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hap_om_order_lines_tl
-- ----------------------------
INSERT INTO `hap_om_order_lines_tl` VALUES ('11', 'en_GB', 'shanghaihand', 'shenghuoyongpin', '1', '1', '1', '-1', '2017-04-02 21:30:54', '-1', '2017-04-02 21:30:54', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('11', 'zh_CN', '上海汉得', '生活用品', '1', '1', '1', '-1', '2017-04-02 21:31:26', '-1', '2017-04-02 21:31:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('12', 'en_GB', 'fupingzhangba', 'sportyongpin', '1', '1', '1', '-1', '2017-04-02 21:32:07', '-1', '2017-04-02 21:32:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('12', 'zh_CN', '富平丈八', '运动用品', '1', '1', '1', '-1', '2017-04-02 21:32:33', '-1', '2017-04-02 21:32:33', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('13', 'en_GB', 'shanxixian', 'xisuyongpin', '1', '1', '1', '-1', '2017-04-02 21:33:22', '-1', '2017-04-02 21:33:22', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('13', 'zh_CN', '陕西西安', '洗簌用品', '1', '1', '1', '-1', '2017-04-02 21:34:08', '-1', '2017-04-02 21:34:08', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('14', 'en_GB', '富平丈八', '体育用品', '1', '1', '1', null, '2017-04-07 13:16:30', null, '2017-04-07 13:16:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('14', 'zh_CN', '富平丈八', '体育用品', '1', '1', '1', null, '2017-04-07 13:16:30', null, '2017-04-07 13:16:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('15', 'en_GB', '1', '1', '1', '1', '1', null, '2017-04-10 16:26:38', null, '2017-04-10 16:26:38', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('15', 'zh_CN', '1', '1', '1', '1', '1', null, '2017-04-10 16:26:38', null, '2017-04-10 16:26:38', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('16', 'en_GB', '2', '1', '1', '1', '1', null, '2017-04-10 16:27:03', null, '2017-04-10 16:27:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines_tl` VALUES ('16', 'zh_CN', '2', '1', '1', '1', '1', null, '2017-04-10 16:27:03', null, '2017-04-10 16:27:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_org_companys_b
-- ----------------------------
DROP TABLE IF EXISTS `hap_org_companys_b`;
CREATE TABLE `hap_org_companys_b` (
  `COMPANY_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `COMPANY_NUMBER` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公司编号',
  `COMPANY_NAME` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公司名称',
  `ENABLED_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '启用标识',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(255) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) NOT NULL DEFAULT '1',
  `ENABLED` varchar(255) DEFAULT NULL,
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`COMPANY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='公司主数据';

-- ----------------------------
-- Records of hap_org_companys_b
-- ----------------------------
INSERT INTO `hap_org_companys_b` VALUES ('101', 'HAND001', '汉得信息', 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, '1', null, '-1', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_org_companys_b` VALUES ('102', 'HAND002', '汉得教育', 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, '1', null, '-1', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_org_companys_b` VALUES ('103', 'HAND003', '汉得保理', 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, '1', null, '-1', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_org_companys_b` VALUES ('104', 'HAND004', '随身科技', 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, '1', null, '-1', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_org_companys_b` VALUES ('105', 'HAND005', '夏尔科技', 'N', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, '1', null, '-1', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_org_companys_tl
-- ----------------------------
DROP TABLE IF EXISTS `hap_org_companys_tl`;
CREATE TABLE `hap_org_companys_tl` (
  `COMPANY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LANG` varchar(50) NOT NULL,
  `COMPANY_NAME` varchar(240) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`COMPANY_ID`,`LANG`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hap_org_companys_tl
-- ----------------------------
INSERT INTO `hap_org_companys_tl` VALUES ('101', 'en_GB', 'handteach', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_org_companys_tl` VALUES ('101', 'zh_CN', '汉得科技', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_org_companys_tl` VALUES ('102', 'en_GB', 'handtec', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_org_companys_tl` VALUES ('102', 'zh_CN', '汉得教育', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_org_companys_tl` VALUES ('103', 'en_GB', 'handprotest', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_org_companys_tl` VALUES ('103', 'zh_CN', '汉得保理', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_org_companys_tl` VALUES ('104', 'en_GB', 'suishentec', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_org_companys_tl` VALUES ('104', 'zh_CN', '随身科技', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_org_companys_tl` VALUES ('105', 'en_GB', 'xiaertec', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');
INSERT INTO `hap_org_companys_tl` VALUES ('105', 'zh_CN', '夏尔科技', '-1', '2016-08-24 16:48:17', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1');

-- ----------------------------
-- Table structure for hr_employee
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee`;
CREATE TABLE `hr_employee` (
  `EMPLOYEE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_CODE` varchar(30) NOT NULL COMMENT '员工编码',
  `NAME` varchar(50) NOT NULL COMMENT '员工姓名',
  `BORN_DATE` date DEFAULT NULL COMMENT '出生日期',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `MOBIL` varchar(50) DEFAULT NULL COMMENT '移动电话',
  `JOIN_DATE` date DEFAULT NULL COMMENT '入职日期',
  `GENDER` varchar(1) DEFAULT NULL COMMENT '性别',
  `CERTIFICATE_ID` varchar(100) NOT NULL COMMENT 'ID',
  `STATUS` varchar(50) NOT NULL COMMENT '状态',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `HR_EMPLOYEE_U1` (`EMPLOYEE_CODE`),
  UNIQUE KEY `HR_EMPLOYEE_U2` (`CERTIFICATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_employee
-- ----------------------------
INSERT INTO `hr_employee` VALUES ('10002', 'Rodgers', '罗杰斯', '2000-01-02', 'shengyang.zhou@hand-china.com', '139', '2016-06-16', 'M', '37132502', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee` VALUES ('10003', 'Hailen', '林海伦', '2000-01-03', 'shengyang.zhou@hand-china.com', '189', '2016-06-17', 'F', '37132503', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee` VALUES ('10004', 'Jessen', '周杰森', '2000-01-04', 'shengyang.zhou@hand-china.com', '13764784776', '2016-06-18', 'M', '37132511', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee` VALUES ('10005', 'Eric', '刘丹', '2000-01-05', 'eric.hap@126.com', '13876499', '2016-06-19', 'M', '5675453', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee` VALUES ('10006', 'ADMIN', '管理员', '2000-01-01', 'shengyang.zhou@hand-china.com', '13764784777', '2016-06-15', 'M', '1', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-04-10 14:45:50', '-1', '2017-04-10 14:45:50', '-1');
INSERT INTO `hr_employee` VALUES ('10007', 'Tony', '辰东', '2000-01-06', 'tony.hap@126.com', '1889343', '2016-06-20', 'M', '3445562', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-04-10 14:45:50', '-1', '2017-04-10 14:45:50', '-1');

-- ----------------------------
-- Table structure for hr_employee_assign
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee_assign`;
CREATE TABLE `hr_employee_assign` (
  `ASSIGN_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_ID` bigint(20) NOT NULL COMMENT '员工ID',
  `POSITION_ID` bigint(20) NOT NULL COMMENT '岗位ID',
  `PRIMARY_POSITION_FLAG` varchar(1) DEFAULT NULL COMMENT '主岗位标示',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`ASSIGN_ID`),
  UNIQUE KEY `HR_EMPLOYEE_ASSIGN_U1` (`EMPLOYEE_ID`,`POSITION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_employee_assign
-- ----------------------------
INSERT INTO `hr_employee_assign` VALUES ('10001', '10001', '10001', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10002', '10006', '10003', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10003', '10002', '10011', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10004', '10002', '10012', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10005', '10004', '10012', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10006', '10003', '10010', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10007', '10005', '10009', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10008', '10007', '10001', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-30 18:31:38', '-1', '2017-03-30 18:31:38', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10009', '10006', '10001', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-04-10 14:45:50', '-1', '2017-04-10 14:45:50', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10010', '10007', '10003', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-04-10 14:45:50', '-1', '2017-04-10 14:45:50', '-1');

-- ----------------------------
-- Table structure for hr_org_position_b
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_position_b`;
CREATE TABLE `hr_org_position_b` (
  `POSITION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UNIT_ID` bigint(20) NOT NULL COMMENT '组织ID',
  `POSITION_CODE` varchar(50) DEFAULT NULL COMMENT '岗位编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '岗位名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '岗位描述',
  `PARENT_POSITION_ID` bigint(20) DEFAULT NULL COMMENT '父岗位ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`POSITION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_position_b
-- ----------------------------
INSERT INTO `hr_org_position_b` VALUES ('10001', '10002', 'ADMIN', '管理员', '管理员', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10002', '10002', 'CEO', '首席执行官', '首席执行官', '10001', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10003', '10003', 'TECT_INSPECTOR', '技术总监', '技术总监', '10002', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10004', '10007', 'SALE_INSPECTOR', '销售总监', '销售部门总监', '10002', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10005', '10008', 'FIN_INSPECTOR', '财务总监', '财务部总监', '10002', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10006', '10006', 'MARKET_INSPECTOR', '市场部总监', '市场部总监', '10002', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10007', '10005', '111428', '人事总监', '人力资源部总监', '10002', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10008', '10005', '101662', '人事经理', '人力资源部经理', '10007', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10009', '10005', '115189', '人事主管', '人事主管', '10008', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10010', '10005', '110143', '人事专员', '人事专员', '10009', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10011', '10004', '115769', '研发总监', '研发部门总监', '10003', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10012', '10004', '115731', '研发工程师', '研发工程师', '10011', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');

-- ----------------------------
-- Table structure for hr_org_position_tl
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_position_tl`;
CREATE TABLE `hr_org_position_tl` (
  `POSITION_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`POSITION_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_position_tl
-- ----------------------------
INSERT INTO `hr_org_position_tl` VALUES ('10001', 'en_GB', 'ADMIN', 'ADMIN', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10001', 'zh_CN', '管理员', '管理员', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10002', 'en_GB', 'CEO', 'CEO', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10002', 'zh_CN', '首席执行官', '首席执行官', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10003', 'en_GB', 'TECH', 'Technical Director', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10003', 'zh_CN', '技术总监', '技术总监', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10004', 'en_GB', 'Sales Director', 'Sales Director', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10004', 'zh_CN', '销售总监', '销售部门总监', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10005', 'en_GB', 'Financial Controller', 'Financial Controller', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10005', 'zh_CN', '财务总监', '财务部总监', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10006', 'en_GB', 'Marketing Director', 'Marketing Director', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10006', 'zh_CN', '市场部总监', '市场部总监', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10007', 'en_GB', 'Human Resources Director', 'Human Resources Director', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10007', 'zh_CN', '人事总监', '人力资源部总监', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10008', 'en_GB', 'HR Manager', 'HR Manager', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10008', 'zh_CN', '人事经理', '人力资源部经理', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10009', 'en_GB', 'Human Resources Supervisor', 'Human Resources Supervisor', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10009', 'zh_CN', '人事主管', '人事主管', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10010', 'en_GB', 'HR Consultant', 'HR Consultant', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10010', 'zh_CN', '人事专员', '人事专员', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10011', 'en_GB', 'R & D Director', 'Research & Development Director', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10011', 'zh_CN', '研发总监', '研发部门总监', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10012', 'en_GB', 'R & D Engineer', 'R & D Engineer', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10012', 'zh_CN', '研发工程师', '研发工程师', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');

-- ----------------------------
-- Table structure for hr_org_unit_b
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_unit_b`;
CREATE TABLE `hr_org_unit_b` (
  `UNIT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '父组织',
  `UNIT_CODE` varchar(50) DEFAULT NULL COMMENT '组织编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `MANAGER_POSITION` bigint(20) DEFAULT NULL COMMENT '组织管理岗位',
  `COMPANY_ID` bigint(20) DEFAULT NULL COMMENT '公司ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`UNIT_ID`),
  UNIQUE KEY `HR_ORG_UNIT_U1` (`UNIT_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_unit_b
-- ----------------------------
INSERT INTO `hr_org_unit_b` VALUES ('10001', null, '1000', '汉得信息技术股份有限公司', '汉得信息技术股份有限公司', '10002', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10002', '10001', '100000', '汉得信息', '汉得信息', '10002', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10003', '10002', '100020', '技术部', '技术服务中心', '10003', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10004', '10003', '100040', '基础研发部', '基础研发部', '10011', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10005', '10002', '100050', '人力资源部', '人力资源部', '10007', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10006', '10002', '100060', '市场部', '市场部', '10006', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10007', '10002', '100070', '销售部', '销售部门', '10004', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10008', '10002', '100080', '财务部', '财务部门', '10005', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');

-- ----------------------------
-- Table structure for hr_org_unit_tl
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_unit_tl`;
CREATE TABLE `hr_org_unit_tl` (
  `UNIT_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`UNIT_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_unit_tl
-- ----------------------------
INSERT INTO `hr_org_unit_tl` VALUES ('10001', 'en_GB', 'Hand China Co.,Ltd', 'Hand China Co.,Ltd', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10001', 'zh_CN', '汉得信息技术股份有限公司', '汉得信息技术股份有限公司', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10002', 'en_GB', 'Hand', 'Hand', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10002', 'zh_CN', '汉得信息', '汉得信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10003', 'en_GB', 'TECH', 'TECH', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10003', 'zh_CN', '技术部', '技术服务中心', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10004', 'en_GB', 'R&D', 'Research & Developement', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10004', 'zh_CN', '基础研发部', '基础研发部', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10005', 'en_GB', 'HR', 'HR', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10005', 'zh_CN', '人力资源部', '人力资源部', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10006', 'en_GB', 'Marketing Department', 'Marketing Department', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10006', 'zh_CN', '市场部', '市场部', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10007', 'en_GB', 'Sales Department', 'Sales Department', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10007', 'zh_CN', '销售部', '销售部门', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10008', 'en_GB', 'Financial', 'Financial Management Department）', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10008', 'zh_CN', '财务部', '财务部门', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');

-- ----------------------------
-- Table structure for hss_setup_trx_detail_b
-- ----------------------------
DROP TABLE IF EXISTS `hss_setup_trx_detail_b`;
CREATE TABLE `hss_setup_trx_detail_b` (
  `TRX_DETAIL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `TRX_ID` bigint(20) NOT NULL COMMENT '事务类型ID',
  `DETAIL_TRX_TYPE` varchar(240) NOT NULL COMMENT '标识',
  `DETAIL_TRX_TYPE_NAME` varchar(240) NOT NULL COMMENT '名称',
  `CATEGORY_CODE` varchar(30) NOT NULL COMMENT '类别',
  `PARENT_DETAIL_ID` bigint(20) DEFAULT NULL COMMENT '父节点ID',
  `IS_DISPLAY_FLAG` varchar(1) DEFAULT NULL COMMENT '工单创建界面是否显示',
  `SSC_ID` bigint(20) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) NOT NULL DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `CREATION_DATE` datetime NOT NULL,
  `CREATED_BY` int(11) NOT NULL DEFAULT '-1',
  `LAST_UPDATED_BY` int(11) NOT NULL DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime NOT NULL,
  `LAST_UPDATE_LOGIN` int(11) DEFAULT NULL,
  `PROGRAM_APPLICATION_ID` int(11) DEFAULT NULL,
  `PROGRAM_ID` int(11) DEFAULT NULL,
  `PROGRAM_UPDATE_DATE` datetime DEFAULT NULL,
  `REQUEST_ID` int(11) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(150) DEFAULT NULL,
  `ATTRIBUTE2` varchar(150) DEFAULT NULL,
  `ATTRIBUTE3` varchar(150) DEFAULT NULL,
  `ATTRIBUTE4` varchar(150) DEFAULT NULL,
  `ATTRIBUTE5` varchar(150) DEFAULT NULL,
  `ATTRIBUTE6` varchar(150) DEFAULT NULL,
  `ATTRIBUTE7` varchar(150) DEFAULT NULL,
  `ATTRIBUTE8` varchar(150) DEFAULT NULL,
  `ATTRIBUTE9` varchar(150) DEFAULT NULL,
  `ATTRIBUTE10` varchar(150) DEFAULT NULL,
  `ATTRIBUTE11` varchar(150) DEFAULT NULL,
  `ATTRIBUTE12` varchar(150) DEFAULT NULL,
  `ATTRIBUTE13` varchar(150) DEFAULT NULL,
  `ATTRIBUTE14` varchar(150) DEFAULT NULL,
  `ATTRIBUTE15` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`TRX_DETAIL_ID`),
  KEY `HSS_SETUP_TRX_DETAIL_B_N1` (`TRX_ID`),
  KEY `HSS_SETUP_TRX_DETAIL_B_N2` (`PARENT_DETAIL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='事务类型层级结构基表';

-- ----------------------------
-- Records of hss_setup_trx_detail_b
-- ----------------------------
INSERT INTO `hss_setup_trx_detail_b` VALUES ('5', '4', '1', '1', '1', null, null, null, '1', '2017-06-18 10:04:54', '-1', '-1', '2017-06-18 10:04:57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_detail_b` VALUES ('6', '5', '1', '1', '1', null, null, null, '1', '2017-06-18 10:05:20', '-1', '-1', '2017-06-18 11:05:14', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_detail_b` VALUES ('8', '6', '1', '1', '1', null, null, null, '1', '2017-06-18 10:05:46', '-1', '-1', '2017-06-18 10:05:49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_detail_b` VALUES ('10', '20', '1', '1', '1', null, null, null, '1', '2017-06-18 10:08:09', '-1', '-1', '2017-06-18 10:08:12', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_detail_b` VALUES ('11', '21', '2', '2', '2', null, null, null, '1', '2017-06-18 10:08:41', '-1', '-1', '2017-06-18 10:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_detail_b` VALUES ('12', '22', '3', '3', '3', null, null, null, '1', '2017-06-18 10:09:07', '-1', '-1', '2017-06-18 10:09:10', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_detail_b` VALUES ('13', '23', '2', '2', '2', null, null, null, '1', '2017-06-18 10:09:30', '-1', '-1', '2017-06-18 10:09:33', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_detail_b` VALUES ('16', '4', '2', '2', 'CATEGORY', '5', 'Y', null, '1', '2017-06-18 10:10:50', '10001', '10001', '2017-06-18 10:10:50', '10001', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hss_setup_trx_detail_tl
-- ----------------------------
DROP TABLE IF EXISTS `hss_setup_trx_detail_tl`;
CREATE TABLE `hss_setup_trx_detail_tl` (
  `TRX_DETAIL_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `DETAIL_TRX_TYPE_NAME` varchar(40) DEFAULT NULL COMMENT '事务层级类型名称',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`TRX_DETAIL_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hss_setup_trx_detail_tl
-- ----------------------------

-- ----------------------------
-- Table structure for hss_setup_trx_type_b
-- ----------------------------
DROP TABLE IF EXISTS `hss_setup_trx_type_b`;
CREATE TABLE `hss_setup_trx_type_b` (
  `TRX_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `TRX_TYPE` varchar(240) NOT NULL COMMENT '事务类型标识',
  `TRX_TYPE_NAME` varchar(240) NOT NULL COMMENT '事务类型名称',
  `VERSION_NUMBER` bigint(20) DEFAULT '1' COMMENT '版本',
  `ORI_TRX_TYPE_ID` bigint(20) DEFAULT NULL COMMENT '升版事务类型ID',
  `STATUS_CODE` varchar(30) NOT NULL COMMENT '状态',
  `START_DATE` datetime DEFAULT NULL COMMENT '有效日期从',
  `END_DATE` datetime DEFAULT NULL COMMENT '有效日期至',
  `LEVEL_NO` bigint(20) NOT NULL COMMENT '启用层级数',
  `SSC_ID` bigint(20) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) NOT NULL DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `CREATION_DATE` datetime NOT NULL,
  `CREATED_BY` int(11) NOT NULL DEFAULT '-1',
  `LAST_UPDATED_BY` int(11) NOT NULL DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime NOT NULL,
  `LAST_UPDATE_LOGIN` int(11) DEFAULT NULL,
  `PROGRAM_APPLICATION_ID` int(11) DEFAULT NULL,
  `PROGRAM_ID` int(11) DEFAULT NULL,
  `PROGRAM_UPDATE_DATE` datetime DEFAULT NULL,
  `REQUEST_ID` int(11) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(150) DEFAULT NULL,
  `ATTRIBUTE2` varchar(150) DEFAULT NULL,
  `ATTRIBUTE3` varchar(150) DEFAULT NULL,
  `ATTRIBUTE4` varchar(150) DEFAULT NULL,
  `ATTRIBUTE5` varchar(150) DEFAULT NULL,
  `ATTRIBUTE6` varchar(150) DEFAULT NULL,
  `ATTRIBUTE7` varchar(150) DEFAULT NULL,
  `ATTRIBUTE8` varchar(150) DEFAULT NULL,
  `ATTRIBUTE9` varchar(150) DEFAULT NULL,
  `ATTRIBUTE10` varchar(150) DEFAULT NULL,
  `ATTRIBUTE11` varchar(150) DEFAULT NULL,
  `ATTRIBUTE12` varchar(150) DEFAULT NULL,
  `ATTRIBUTE13` varchar(150) DEFAULT NULL,
  `ATTRIBUTE14` varchar(150) DEFAULT NULL,
  `ATTRIBUTE15` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`TRX_TYPE_ID`),
  UNIQUE KEY `TRX_TYPE` (`TRX_TYPE`,`VERSION_NUMBER`),
  UNIQUE KEY `TRX_TYPE_NAME` (`TRX_TYPE_NAME`,`VERSION_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='事务类型基表';

-- ----------------------------
-- Records of hss_setup_trx_type_b
-- ----------------------------
INSERT INTO `hss_setup_trx_type_b` VALUES ('4', '3', '3', '1', null, 'INACTIVE', '2017-05-08 08:25:35', '2017-05-09 00:00:00', '1', null, '5', '2017-05-08 08:33:34', '10001', '10001', '2017-06-18 10:46:44', '10001', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_b` VALUES ('5', '4', '4', '1', null, 'ACTIVE', '2017-05-08 08:25:35', '2017-05-10 00:00:00', '3', null, '2', '2017-05-08 08:34:59', '10001', '10001', '2017-06-18 10:57:29', '10001', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_b` VALUES ('6', '5', '5', '1', null, 'DRAFT', '2017-06-17 16:29:54', '2017-06-17 16:29:54', '5', null, '1', '2017-06-17 16:30:22', '10001', '10001', '2017-06-17 16:30:22', '10001', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_b` VALUES ('20', '1', '1', '1', null, 'DRAFT', '2017-06-18 10:06:21', '2017-06-18 10:06:21', '4', null, '1', '2017-06-18 10:06:51', '10001', '10001', '2017-06-18 10:06:51', '10001', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_b` VALUES ('21', '2', '2', '1', null, 'DRAFT', '2017-06-18 10:06:21', '2017-06-18 10:06:21', '3', null, '1', '2017-06-18 10:07:03', '10001', '10001', '2017-06-18 10:07:03', '10001', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_b` VALUES ('22', '6', '6', '1', null, 'DRAFT', '2017-06-18 10:06:21', '2017-06-18 10:06:21', '6', null, '1', '2017-06-18 10:07:16', '10001', '10001', '2017-06-18 10:07:16', '10001', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_b` VALUES ('23', '7', '7', '1', null, 'DRAFT', '2017-06-18 10:06:21', '2017-06-18 10:06:21', '4', null, '1', '2017-06-18 10:07:32', '10001', '10001', '2017-06-18 10:07:32', '10001', null, '-1', null, '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_b` VALUES ('25', '3', '3', '3', null, 'DRAFT', '2017-05-08 08:25:35', '2017-05-09 00:00:00', '1', null, '1', '2017-06-18 10:44:05', '-1', '-1', '2017-06-18 10:44:05', null, null, null, '2017-06-18 10:44:05', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hss_setup_trx_type_tl
-- ----------------------------
DROP TABLE IF EXISTS `hss_setup_trx_type_tl`;
CREATE TABLE `hss_setup_trx_type_tl` (
  `TRX_TYPE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `TRX_TYPE_NAME` varchar(40) DEFAULT NULL COMMENT '事务类型名称',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`TRX_TYPE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hss_setup_trx_type_tl
-- ----------------------------
INSERT INTO `hss_setup_trx_type_tl` VALUES ('1', 'en_GB', '0', '1', '-1', '-1', '-1', '2017-05-08 09:10:07', '-1', '2017-05-08 09:10:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_tl` VALUES ('1', 'zh_CN', '0', '1', '-1', '-1', '-1', '2017-05-08 09:10:27', '-1', '2017-05-08 09:10:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_tl` VALUES ('2', 'en_GB', '1', '1', '-1', '-1', '-1', '2017-05-08 09:11:00', '-1', '2017-05-08 09:11:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_tl` VALUES ('2', 'zh_CN', '1', '1', '-1', '-1', '-1', '2017-05-08 09:11:08', '-1', '2017-05-08 09:11:08', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_tl` VALUES ('3', 'en_GB', '2', '1', '-1', '-1', '-1', '2017-05-08 09:11:29', '-1', '2017-05-08 09:11:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_tl` VALUES ('3', 'zh_CN', '2', '1', '-1', '-1', '-1', '2017-05-08 09:11:35', '-1', '2017-05-08 09:11:35', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_tl` VALUES ('4', 'en_GB', '3', '1', '-1', '-1', '-1', '2017-05-08 09:11:45', '-1', '2017-05-08 09:11:45', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_tl` VALUES ('4', 'zh_CN', '3', '1', '-1', '-1', '-1', '2017-05-08 09:11:56', '-1', '2017-05-08 09:11:56', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_tl` VALUES ('5', 'en_GB', '4', '1', '-1', '-1', '-1', '2017-05-08 09:12:06', '-1', '2017-05-08 09:12:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_setup_trx_type_tl` VALUES ('5', 'zh_CN', '4', '1', '-1', '-1', '-1', '2017-05-08 09:12:18', '-1', '2017-05-08 09:12:18', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hss_task_item_header_b
-- ----------------------------
DROP TABLE IF EXISTS `hss_task_item_header_b`;
CREATE TABLE `hss_task_item_header_b` (
  `ITEM_HEADER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `INTERFACE_NAME` varchar(30) NOT NULL COMMENT '映射名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '说明',
  `SOURCE_SYSTEM_CODE` varchar(30) NOT NULL COMMENT '系统代码',
  `DATA_TYPE_CODE` varchar(30) NOT NULL COMMENT '数据类型',
  `START_DATE` datetime DEFAULT NULL COMMENT '有效日期从',
  `END_DATE` datetime DEFAULT NULL COMMENT '有效日期至',
  `FROZEN_FLAG` varchar(1) NOT NULL COMMENT '冻结',
  `PARENT_ITEM_HEADER_NAME` varchar(255) DEFAULT NULL,
  `PRINT_URL` varchar(255) DEFAULT NULL,
  `CREATED_NAME` varchar(255) DEFAULT NULL,
  `SYSTEM_NAME` varchar(255) DEFAULT NULL,
  `ENABLED_FLAG` varchar(1) NOT NULL COMMENT '是否启用',
  `VALIDATE_CLASS` varchar(400) DEFAULT NULL COMMENT '执行JAVA校验',
  `SSC_ID` bigint(20) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) NOT NULL DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `CREATION_DATE` datetime NOT NULL,
  `CREATED_BY` int(11) NOT NULL DEFAULT '-1',
  `LAST_UPDATED_BY` int(11) NOT NULL DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime NOT NULL,
  `LAST_UPDATE_LOGIN` int(11) DEFAULT NULL,
  `PROGRAM_APPLICATION_ID` int(11) DEFAULT NULL,
  `PROGRAM_ID` int(11) DEFAULT NULL,
  `PROGRAM_UPDATE_DATE` datetime DEFAULT NULL,
  `REQUEST_ID` int(11) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(150) DEFAULT NULL,
  `ATTRIBUTE2` varchar(150) DEFAULT NULL,
  `ATTRIBUTE3` varchar(150) DEFAULT NULL,
  `ATTRIBUTE4` varchar(150) DEFAULT NULL,
  `ATTRIBUTE5` varchar(150) DEFAULT NULL,
  `ATTRIBUTE6` varchar(150) DEFAULT NULL,
  `ATTRIBUTE7` varchar(150) DEFAULT NULL,
  `ATTRIBUTE8` varchar(150) DEFAULT NULL,
  `ATTRIBUTE9` varchar(150) DEFAULT NULL,
  `ATTRIBUTE10` varchar(150) DEFAULT NULL,
  `ATTRIBUTE11` varchar(150) DEFAULT NULL,
  `ATTRIBUTE12` varchar(150) DEFAULT NULL,
  `ATTRIBUTE13` varchar(150) DEFAULT NULL,
  `ATTRIBUTE14` varchar(150) DEFAULT NULL,
  `ATTRIBUTE15` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ITEM_HEADER_ID`),
  UNIQUE KEY `INTERFACE_NAME` (`INTERFACE_NAME`,`SOURCE_SYSTEM_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='任务行接口设置头基表';

-- ----------------------------
-- Records of hss_task_item_header_b
-- ----------------------------
INSERT INTO `hss_task_item_header_b` VALUES ('1', '1', '1', '1', '1', '2017-06-17 14:43:04', '2017-06-24 14:43:06', '1', null, null, null, '', '1', '1', '1', '1', '2017-06-17 14:43:55', '-1', '-1', '2017-06-17 14:43:21', '1', '1', '1', '2017-06-17 14:43:33', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hss_task_item_header_b` VALUES ('2', '2', '2', '2', '2', '2017-06-18 11:51:28', '2017-06-18 11:51:31', '2', null, null, null, null, '2', '2', '2', '12', '2017-06-18 11:51:49', '-1', '-1', '2017-06-18 11:51:53', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hss_task_item_header_tl
-- ----------------------------
DROP TABLE IF EXISTS `hss_task_item_header_tl`;
CREATE TABLE `hss_task_item_header_tl` (
  `ITEM_HEADER_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `INTERFACE_NAME` varchar(40) DEFAULT NULL COMMENT '映射名称',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ITEM_HEADER_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hss_task_item_header_tl
-- ----------------------------

-- ----------------------------
-- Table structure for hss_task_item_line_b
-- ----------------------------
DROP TABLE IF EXISTS `hss_task_item_line_b`;
CREATE TABLE `hss_task_item_line_b` (
  `ITEM_LINE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `ITEM_HEADER_ID` bigint(20) NOT NULL COMMENT '关联HSS_TASK_ITEM_HEADER_B',
  `TITLE_TEXT` varchar(60) NOT NULL COMMENT '字段描述',
  `COLUMN_TYPE_CODE` varchar(30) NOT NULL COMMENT '字段类型,快码HSS_TASK_COLUM_TYPE',
  `COLUMN_NAME` varchar(100) DEFAULT NULL COMMENT '列名',
  `SEQ_NUM` bigint(20) NOT NULL COMMENT '序号',
  `VALUE_TYPE` varchar(30) NOT NULL COMMENT '值类型,快码HSS_TASK_COLUM_VALUE_TYPE',
  `COLUMN_LEN` bigint(20) DEFAULT NULL COMMENT '字段长度',
  `VALUE_SET` varchar(60) DEFAULT NULL COMMENT '验证值集',
  `COLUMN_FORMAT` varchar(100) DEFAULT NULL COMMENT '验证格式',
  `REQUIRED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '必须，即如果未给值就报错',
  `SHOW_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '显示',
  `ENABLE_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '是否启用，不启用则此字段不会用于模板验证和给值',
  `UNIQUE_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '是否唯一，唯一则需整体验证字段值无重复',
  `DISPLAY_WIDTH` bigint(20) DEFAULT NULL COMMENT '显示宽度',
  `SSC_ID` bigint(20) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) NOT NULL DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `CREATION_DATE` datetime NOT NULL,
  `CREATED_BY` int(11) NOT NULL DEFAULT '-1',
  `LAST_UPDATED_BY` int(11) NOT NULL DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime NOT NULL,
  `LAST_UPDATE_LOGIN` int(11) DEFAULT NULL,
  `PROGRAM_APPLICATION_ID` int(11) DEFAULT NULL,
  `PROGRAM_ID` int(11) DEFAULT NULL,
  `PROGRAM_UPDATE_DATE` datetime DEFAULT NULL,
  `REQUEST_ID` int(11) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(150) DEFAULT NULL,
  `ATTRIBUTE2` varchar(150) DEFAULT NULL,
  `ATTRIBUTE3` varchar(150) DEFAULT NULL,
  `ATTRIBUTE4` varchar(150) DEFAULT NULL,
  `ATTRIBUTE5` varchar(150) DEFAULT NULL,
  `ATTRIBUTE6` varchar(150) DEFAULT NULL,
  `ATTRIBUTE7` varchar(150) DEFAULT NULL,
  `ATTRIBUTE8` varchar(150) DEFAULT NULL,
  `ATTRIBUTE9` varchar(150) DEFAULT NULL,
  `ATTRIBUTE10` varchar(150) DEFAULT NULL,
  `ATTRIBUTE11` varchar(150) DEFAULT NULL,
  `ATTRIBUTE12` varchar(150) DEFAULT NULL,
  `ATTRIBUTE13` varchar(150) DEFAULT NULL,
  `ATTRIBUTE14` varchar(150) DEFAULT NULL,
  `ATTRIBUTE15` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ITEM_LINE_ID`),
  KEY `HSS_TASK_ITEM_LINE_B_N1` (`ITEM_HEADER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='任务行接口设置行基表';

-- ----------------------------
-- Records of hss_task_item_line_b
-- ----------------------------
INSERT INTO `hss_task_item_line_b` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'Y', 'Y', 'Y', 'Y', '1', '1', '1', '2017-06-18 11:54:54', '-1', '-1', '2017-06-18 11:54:58', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hss_task_item_line_tl
-- ----------------------------
DROP TABLE IF EXISTS `hss_task_item_line_tl`;
CREATE TABLE `hss_task_item_line_tl` (
  `ITEM_LINE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `TITLE_TEXT` varchar(40) DEFAULT NULL COMMENT '字段描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ITEM_LINE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hss_task_item_line_tl
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler', 'LAPTOP-LI1I98591497670045796', '1497676630423', '20000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_account_retrieve
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_retrieve`;
CREATE TABLE `sys_account_retrieve` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RETRIEVE_TYPE` varchar(30) DEFAULT NULL COMMENT '类型:NAME/PWD',
  `RETRIEVE_DATE` datetime DEFAULT NULL COMMENT '时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_account_retrieve
-- ----------------------------

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment` (
  `ATTACHMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `NAME` varchar(40) DEFAULT NULL COMMENT '附件名称',
  `SOURCE_TYPE` varchar(30) DEFAULT NULL COMMENT '对应业务类型',
  `SOURCE_KEY` varchar(40) DEFAULT NULL COMMENT '业务主键',
  `STATUS` varchar(1) DEFAULT NULL COMMENT '状态',
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '开始生效日期',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '失效时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENT_ID`),
  KEY `SYS_ATTACHMENT_N1` (`CATEGORY_ID`),
  KEY `SYS_ATTACHMENT_N2` (`SOURCE_TYPE`,`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_attach_category_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_attach_category_b`;
CREATE TABLE `sys_attach_category_b` (
  `CATEGORY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(40) DEFAULT NULL,
  `LEAF_FLAG` varchar(1) DEFAULT NULL,
  `DESCRIPTION` varchar(240) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  `PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PATH` varchar(200) DEFAULT NULL COMMENT '层级路径',
  `SOURCE_TYPE` varchar(30) DEFAULT NULL,
  `ALLOWED_FILE_TYPE` varchar(30) DEFAULT NULL,
  `ALLOWED_FILE_SIZE` decimal(20,0) DEFAULT NULL,
  `IS_UNIQUE` varchar(1) DEFAULT NULL,
  `CATEGORY_PATH` varchar(255) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attach_category_b
-- ----------------------------
INSERT INTO `sys_attach_category_b` VALUES ('1', '目录1', '0', '目录1', '1', '-1', '1', 'FOLDER', null, null, 'Y', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_b` VALUES ('2', '目录2', '0', '目录2', '1', '1', '1.2', 'FOLDER', null, null, 'N', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_b` VALUES ('3', '目录3', '0', '叶节点1', '1', '2', '1.2.3', 'IMG', null, null, 'Y', '/Users/jessen/Pictures/hap/img', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_b` VALUES ('4', 'Leaf 1.1', '1', 'Leaf 1.1', '1', '3', '1.2.3.4', 'IMG2', '.jpg;.jpeg;.png', null, 'N', '/Users/jessen/Pictures/hap/img', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_attach_category_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_attach_category_tl`;
CREATE TABLE `sys_attach_category_tl` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `CATEGORY_NAME` varchar(40) DEFAULT NULL COMMENT '类别名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '角色描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attach_category_tl
-- ----------------------------
INSERT INTO `sys_attach_category_tl` VALUES ('1', 'en_GB', 'Category1', 'Category1', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('1', 'zh_CN', '目录1', '目录1', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('2', 'en_GB', 'Category2', 'Category2', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('2', 'zh_CN', '目录2', '目录2', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('3', 'en_GB', 'Category3', 'Left1', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('3', 'zh_CN', '目录3', '叶节点1', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('4', 'en_GB', 'Leaf1.1', 'Leaf 1.1', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('4', 'zh_CN', 'Leaf 1.1', 'Leaf 1.1', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_code_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_b`;
CREATE TABLE `sys_code_b` (
  `CODE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(30) NOT NULL COMMENT '快码类型',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码类型描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`),
  UNIQUE KEY `SYS_CODE_B_U1` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10022 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_code_b
-- ----------------------------
INSERT INTO `sys_code_b` VALUES ('10001', 'HR.EMPLOYEE_GENDER', '性别', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10002', 'HR.EMPLOYEE_STATUS', '员工状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10003', 'SYS.ALIGN_TYPE', '对齐方式', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10004', 'SYS.CAPTCHA_POLICY', '验证码策略', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10005', 'SYS.LOV_EDITOR_TYPE', 'LOV 编辑器类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10006', 'SYS.PRIORITY_LEVEL', '模板优先级', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10007', 'SYS.PROFILE_LEVEL_ID', '配置文件级别', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10008', 'SYS.RESOURCE_TYPE', '资源类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10009', 'SYS.TIME_ZONE', '时区', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10010', 'SYS.USER_STATUS', '用户状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10011', 'SYS.YES_NO', '是否 YN', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10012', 'SYS.PASSWORD_COMPLEXITY', '密码复杂度要求', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10013', 'SYS.IF.REQUEST_STATUS', '接口调用状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10014', 'SALE.ORDER_STATUS', '销售订单状态', '6', '-1', '-1', '10001', '2017-04-02 13:57:07', '10001', '2017-04-02 16:07:08', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10015', 'HPPS.TRX_TYPE_STATUS', '事务类型状态', '7', '-1', '-1', '10001', '2017-04-21 11:46:44', '10001', '2017-06-18 10:36:36', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10016', 'HSS_SETUP_TRX_LEVEL', '事务启动层级数', '5', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10017', 'ITEM.ITEM_HEADER_DATATYPE', '数据类型', '2', '-1', '-1', '10001', '2017-06-18 11:18:10', '10001', '2017-06-18 11:43:32', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10018', 'HSS_SETUP_DATE_FORMAT', '掩码格式', '2', '-1', '-1', '10001', '2017-06-18 11:21:53', '10001', '2017-06-18 11:43:49', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10019', 'HSS_TASK_COLUM_VALUE_TYPE', '值类型', '2', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:44:47', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10020', 'HSS_TASK_COLUM_TYPE', '字段', '2', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:45:08', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10021', 'HSS_SETUP_SOURCE_SYSTEM', '字段类型', '1', '-1', '-1', '10001', '2017-06-18 11:26:29', '10001', '2017-06-18 11:26:29', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_code_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_tl`;
CREATE TABLE `sys_code_tl` (
  `CODE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_code_tl
-- ----------------------------
INSERT INTO `sys_code_tl` VALUES ('10001', 'en_GB', 'Gender', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10001', 'zh_CN', '性别', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10002', 'en_GB', 'Employee Status', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10002', 'zh_CN', '员工状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10003', 'en_GB', 'Align Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10003', 'zh_CN', '对齐方式', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10004', 'en_GB', 'Captcha Policy', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10004', 'zh_CN', '验证码策略', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10005', 'en_GB', 'LOV Editor Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10005', 'zh_CN', 'LOV 编辑器类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10006', 'en_GB', 'Template Priority', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10006', 'zh_CN', '模板优先级', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10007', 'en_GB', 'Profile Level', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10007', 'zh_CN', '配置文件级别', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10008', 'en_GB', 'Resource Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10008', 'zh_CN', '资源类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10009', 'en_GB', 'Time Zone', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10009', 'zh_CN', '时区', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10010', 'en_GB', 'User Status', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10010', 'zh_CN', '用户状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10011', 'en_GB', 'Yes No', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10011', 'zh_CN', '是否 YN', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10012', 'en_GB', 'Password Complexity', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10012', 'zh_CN', '密码复杂度要求', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10013', 'en_GB', 'Interface Invoke State', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10013', 'zh_CN', '接口调用状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10014', 'en_GB', 'SALE.ORDER_STATUS', '1', '-1', '-1', '10001', '2017-04-02 13:57:06', '10001', '2017-04-02 16:07:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10014', 'zh_CN', '销售订单状态', '1', '-1', '-1', '10001', '2017-04-02 13:57:06', '10001', '2017-04-02 16:07:08', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10015', 'en_GB', 'xwlxzt', '1', '-1', '-1', '10001', '2017-04-21 11:46:44', '10001', '2017-04-21 11:46:44', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10015', 'zh_CN', '事务类型状态', '1', '-1', '-1', '10001', '2017-04-21 11:46:44', '10001', '2017-06-18 10:36:36', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10016', 'en_GB', 'swqdcjs', '1', '-1', '-1', '10001', '2017-04-21 11:49:44', '10001', '2017-04-21 11:49:44', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10016', 'zh_CN', '事务启动层级数', '1', '-1', '-1', '10001', '2017-04-21 11:49:44', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10017', 'en_GB', '数据类型', '1', '-1', '-1', '10001', '2017-06-18 11:18:09', '10001', '2017-06-18 11:18:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10017', 'zh_CN', '数据类型', '1', '-1', '-1', '10001', '2017-06-18 11:18:09', '10001', '2017-06-18 11:43:32', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10018', 'en_GB', '掩码格式', '1', '-1', '-1', '10001', '2017-06-18 11:21:52', '10001', '2017-06-18 11:21:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10018', 'zh_CN', '掩码格式', '1', '-1', '-1', '10001', '2017-06-18 11:21:52', '10001', '2017-06-18 11:43:49', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10019', 'en_GB', '值类型', '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:23:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10019', 'zh_CN', '值类型', '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:44:47', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10020', 'en_GB', '字段', '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10020', 'zh_CN', '字段', '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:45:08', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10021', 'en_GB', '字段类型', '1', '-1', '-1', '10001', '2017-06-18 11:26:29', '10001', '2017-06-18 11:26:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10021', 'zh_CN', '字段类型', '1', '-1', '-1', '10001', '2017-06-18 11:26:29', '10001', '2017-06-18 11:26:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_code_value_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_value_b`;
CREATE TABLE `sys_code_value_b` (
  `CODE_VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE_ID` bigint(20) DEFAULT NULL,
  `VALUE` varchar(150) DEFAULT NULL COMMENT '快码值',
  `MEANING` varchar(150) DEFAULT NULL COMMENT '快码意思',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `ORDER_SEQ` int(11) DEFAULT '10',
  PRIMARY KEY (`CODE_VALUE_ID`),
  UNIQUE KEY `SYS_CODE_VALUE_B_U1` (`CODE_ID`,`VALUE`)
) ENGINE=InnoDB AUTO_INCREMENT=10076 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_code_value_b
-- ----------------------------
INSERT INTO `sys_code_value_b` VALUES ('10001', '10008', 'HTML', 'HTML页面', 'HTML页面', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10002', '10008', 'SERVICE', 'URL服务', 'URL服务', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10003', '10005', 'INT', '数字框', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10004', '10005', 'POPUP', '值列表', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10005', '10005', 'SELECT', '下拉框', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10006', '10005', 'TEXT', '文本框', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10007', '10005', 'DATE', '日期框', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10008', '10011', 'N', '否', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10009', '10011', 'Y', '是', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10010', '10003', 'CENTER', '居中', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10011', '10003', 'LEFT', '左对齐', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10012', '10003', 'RIGHT', '右对齐', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10013', '10007', '10', '全局', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10014', '10007', '20', '角色', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10015', '10007', '30', '用户', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10016', '10006', 'NORMAL', '普通', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10017', '10006', 'VIP', 'VIP', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10018', '10009', 'GMT+0800', '(GMT+8)北京时间', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10019', '10009', 'GMT-0500', '(GMT-5)纽约', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10020', '10009', 'GMT-0800', '(GMT-8)旧金山', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10021', '10010', 'ACTV', '有效', '有效', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10022', '10010', 'EXPR', '过期', '过期', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10023', '10010', 'LOCK', '已锁定', '锁定', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10024', '10004', 'AFTER3', '登录失败3次启用验证码', '登录失败3次启用验证码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10025', '10004', 'DISABLE', '禁用验证码', '禁用验证码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10026', '10004', 'ENABLE', '启用验证码', '启用验证码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10027', '10001', 'F', '女', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10028', '10001', 'M', '男', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10029', '10002', 'NORMAL', '正式', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10030', '10002', 'OFFWORK', '离职', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10031', '10002', 'PRAC', '实习', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10032', '10002', 'RETIRE', '退休', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10033', '10002', 'TRAIL', '试用', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10034', '10012', 'no_limit', '无限制', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10035', '10012', 'digits_and_letters', '必须混合数字和字母', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10036', '10012', 'digits_and_case_letters', '必须混合数字和大小写字母', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10037', '10013', 'success', '成功', '接口调用成功', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10038', '10013', 'failure', '失败', '接口调用失败', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10039', '10014', 'NEW', '新建', '新建', '3', '-1', '-1', '10001', '2017-04-02 13:59:12', '10001', '2017-04-02 15:48:38', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_code_value_b` VALUES ('10040', '10014', 'SUBMIT', '提交', '提交', '2', '-1', '-1', '10001', '2017-04-02 14:00:28', '10001', '2017-04-02 15:48:38', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2');
INSERT INTO `sys_code_value_b` VALUES ('10041', '10015', 'DRAFT', '拟定', '拟定', '5', '-1', '-1', '10001', '2017-04-21 11:46:44', '10001', '2017-06-18 10:36:36', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10042', '10015', 'ACTIVE', '有效', '有效', '3', '-1', '-1', '10001', '2017-04-21 11:47:38', '10001', '2017-06-18 10:36:36', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10043', '10015', 'INACTIVE', '无效', '无效', '3', '-1', '-1', '10001', '2017-04-21 11:47:58', '10001', '2017-06-18 10:36:36', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10044', '10016', '10', '10', null, '3', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10045', '10016', '9', '9', null, '3', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10046', '10016', '8', '8', null, '3', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10047', '10016', '7', '7', null, '3', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10048', '10016', '6', '6', null, '3', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10049', '10016', '5', '5', null, '3', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10050', '10016', '4', '4', null, '3', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10051', '10016', '3', '3', null, '3', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10052', '10016', '2', '2', null, '3', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10053', '10016', '1', '1', null, '3', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10054', '10017', 'feiyongleixing', '费用类型', null, '1', '-1', '-1', '10001', '2017-06-18 11:18:10', '10001', '2017-06-18 11:18:10', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10055', '10017', 'yingxiangshuju', '影像数据', null, '1', '-1', '-1', '10001', '2017-06-18 11:18:10', '10001', '2017-06-18 11:18:10', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10056', '10017', 'yewushuju', '业务数据', null, '1', '-1', '-1', '10001', '2017-06-18 11:18:10', '10001', '2017-06-18 11:18:10', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10057', '10018', 'yy-MM-dd', 'yy-MM-dd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:53', '10001', '2017-06-18 11:21:53', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10058', '10018', 'yyyy/MM/dd', 'yyyy/MM/dd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:53', '10001', '2017-06-18 11:21:53', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10059', '10018', 'yyyy-MM-dd', 'yyyy-MM-dd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:53', '10001', '2017-06-18 11:21:53', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10060', '10018', 'yyMMdd', 'yyMMdd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:53', '10001', '2017-06-18 11:21:53', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10061', '10019', 'char', '字符', null, '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:23:09', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10062', '10019', 'number', '数字', null, '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:23:09', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10063', '10019', 'date', '日期', null, '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:23:09', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10064', '10020', 'VALUE11', 'VALUE11', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10065', '10020', 'VALUE10', 'VALUE10', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10066', '10020', 'VALUE9', 'VALUE9', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10067', '10020', 'VALUE8', 'VALUE8', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10068', '10020', 'VALUE7', 'VALUE7', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10069', '10020', 'VALUE6', 'VALUE6', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10070', '10020', 'VALUE5', 'VALUE5', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10071', '10020', 'VALUE4', 'VALUE4', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10072', '10020', 'VALUE3', 'VALUE3', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10073', '10020', 'VALUE2', 'VALUE2', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10074', '10020', 'VALUE1', 'VALUE1', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:13', '10001', '2017-06-18 11:25:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `sys_code_value_b` VALUES ('10075', '10021', 'shujuleixing', '源数据列', null, '1', '-1', '-1', '10001', '2017-06-18 11:26:29', '10001', '2017-06-18 11:26:29', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for sys_code_value_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_value_tl`;
CREATE TABLE `sys_code_value_tl` (
  `CODE_VALUE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `MEANING` varchar(150) DEFAULT NULL COMMENT '快码意思',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_VALUE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_code_value_tl
-- ----------------------------
INSERT INTO `sys_code_value_tl` VALUES ('10001', 'en_GB', 'HTML页面', 'HTML页面', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10001', 'zh_CN', 'HTML页面', 'HTML页面', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10002', 'en_GB', 'URL服务', 'URL服务', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10002', 'zh_CN', 'URL服务', 'URL服务', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10003', 'en_GB', 'Number', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10003', 'zh_CN', '数字框', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10004', 'en_GB', 'Popup', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10004', 'zh_CN', '值列表', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10005', 'en_GB', 'Select', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10005', 'zh_CN', '下拉框', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10006', 'en_GB', 'Text', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10006', 'zh_CN', '文本框', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10007', 'en_GB', 'Date', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10007', 'zh_CN', '日期框', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10008', 'en_GB', 'No', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10008', 'zh_CN', '否', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10009', 'en_GB', 'Yes', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10009', 'zh_CN', '是', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10010', 'en_GB', 'Center', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10010', 'zh_CN', '居中', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10011', 'en_GB', 'Left', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10011', 'zh_CN', '左对齐', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10012', 'en_GB', 'Right', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10012', 'zh_CN', '右对齐', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10013', 'en_GB', 'Global', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10013', 'zh_CN', '全局', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10014', 'en_GB', 'Role', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10014', 'zh_CN', '角色', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10015', 'en_GB', 'User', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10015', 'zh_CN', '用户', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10016', 'en_GB', 'Normal', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10016', 'zh_CN', '普通', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10017', 'en_GB', 'VIP', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10017', 'zh_CN', 'VIP', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10018', 'en_GB', '(GMT+8)Beijing', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10018', 'zh_CN', '(GMT+8)北京时间', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10019', 'en_GB', '(GMT-5)New York', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10019', 'zh_CN', '(GMT-5)纽约', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10020', 'en_GB', '(GMT-8)San Francisco', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10020', 'zh_CN', '(GMT-8)旧金山', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10021', 'en_GB', 'Active', 'Active', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10021', 'zh_CN', '有效', '有效', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10022', 'en_GB', 'Expired', 'Expired', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10022', 'zh_CN', '过期', '过期', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10023', 'en_GB', 'Locked', 'Locked', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10023', 'zh_CN', '已锁定', '锁定', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10024', 'en_GB', 'Enable captcha after 3 failure', 'Enable captcha after login failed 3 times.', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10024', 'zh_CN', '登录失败3次启用验证码', '登录失败3次启用验证码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10025', 'en_GB', 'Disable captcha', 'Disable captcha', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10025', 'zh_CN', '禁用验证码', '禁用验证码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10026', 'en_GB', 'Enable captcha', 'Enable captcha', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10026', 'zh_CN', '启用验证码', '启用验证码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10027', 'en_GB', 'Female', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10027', 'zh_CN', '女', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10028', 'en_GB', 'Male', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10028', 'zh_CN', '男', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10029', 'en_GB', '正式', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10029', 'zh_CN', '正式', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10030', 'en_GB', 'Off Work', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10030', 'zh_CN', '离职', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10031', 'en_GB', 'Practice', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10031', 'zh_CN', '实习', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10032', 'en_GB', 'Retired', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10032', 'zh_CN', '退休', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10033', 'en_GB', 'Trail', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10033', 'zh_CN', '试用', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10034', 'en_GB', 'No Limit', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10034', 'zh_CN', '无限制', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10035', 'en_GB', 'Contains Digits And Letters', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10035', 'zh_CN', '必须混合数字和字母', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10036', 'en_GB', 'Contains Digits And Case Letters', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10036', 'zh_CN', '必须混合数字和大小写字母', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10037', 'en_GB', 'SUCCESS', 'Successful Interface Invoke', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10037', 'zh_CN', '成功', '接口调用成功', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10038', 'en_GB', 'FAILURE', 'Fails Interface Invoke', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10038', 'zh_CN', '失败', '接口调用失败', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10039', 'en_GB', 'new', 'new', '1', '-1', '-1', '10001', '2017-04-02 13:59:11', '10001', '2017-04-02 15:48:38', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10039', 'zh_CN', '新建', '新建', '1', '-1', '-1', '10001', '2017-04-02 13:59:11', '10001', '2017-04-02 15:48:38', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10040', 'en_GB', 'submit', 'submit', '1', '-1', '-1', '10001', '2017-04-02 14:00:27', '10001', '2017-04-02 15:48:38', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10040', 'zh_CN', '提交', '提交', '1', '-1', '-1', '10001', '2017-04-02 14:00:27', '10001', '2017-04-02 15:48:38', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10041', 'en_GB', 'niding', null, '1', '-1', '-1', '10001', '2017-04-21 11:46:44', '10001', '2017-04-21 11:46:44', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10041', 'zh_CN', '拟定', '拟定', '1', '-1', '-1', '10001', '2017-04-21 11:46:44', '10001', '2017-06-18 10:36:36', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10042', 'en_GB', 'youxiao', null, '1', '-1', '-1', '10001', '2017-04-21 11:47:37', '10001', '2017-04-21 11:47:37', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10042', 'zh_CN', '有效', '有效', '1', '-1', '-1', '10001', '2017-04-21 11:47:37', '10001', '2017-06-18 10:36:36', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10043', 'en_GB', 'wuxiao', null, '1', '-1', '-1', '10001', '2017-04-21 11:47:57', '10001', '2017-04-21 11:47:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10043', 'zh_CN', '无效', '无效', '1', '-1', '-1', '10001', '2017-04-21 11:47:57', '10001', '2017-06-18 10:36:36', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10044', 'en_GB', '10', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:44', '10001', '2017-04-21 11:49:44', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10044', 'zh_CN', '10', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:44', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10045', 'en_GB', '9', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:44', '10001', '2017-04-21 11:49:44', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10045', 'zh_CN', '9', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:44', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10046', 'en_GB', '8', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:44', '10001', '2017-04-21 11:49:44', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10046', 'zh_CN', '8', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10047', 'en_GB', '7', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-21 11:49:45', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10047', 'zh_CN', '7', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10048', 'en_GB', '6', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-21 11:49:45', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10048', 'zh_CN', '6', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10049', 'en_GB', '5', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-21 11:49:45', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10049', 'zh_CN', '5', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10050', 'en_GB', '4', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-21 11:49:45', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10050', 'zh_CN', '4', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10051', 'en_GB', '3', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-21 11:49:45', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10051', 'zh_CN', '3', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10052', 'en_GB', '2', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-21 11:49:45', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10052', 'zh_CN', '2', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10053', 'en_GB', '1', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-21 11:49:45', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10053', 'zh_CN', '1', null, '1', '-1', '-1', '10001', '2017-04-21 11:49:45', '10001', '2017-04-22 11:39:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10054', 'en_GB', '费用类型', null, '1', '-1', '-1', '10001', '2017-06-18 11:18:09', '10001', '2017-06-18 11:18:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10054', 'zh_CN', '费用类型', null, '1', '-1', '-1', '10001', '2017-06-18 11:18:09', '10001', '2017-06-18 11:18:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10055', 'en_GB', '影像数据', null, '1', '-1', '-1', '10001', '2017-06-18 11:18:09', '10001', '2017-06-18 11:18:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10055', 'zh_CN', '影像数据', null, '1', '-1', '-1', '10001', '2017-06-18 11:18:09', '10001', '2017-06-18 11:18:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10056', 'en_GB', '业务数据', null, '1', '-1', '-1', '10001', '2017-06-18 11:18:09', '10001', '2017-06-18 11:18:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10056', 'zh_CN', '业务数据', null, '1', '-1', '-1', '10001', '2017-06-18 11:18:09', '10001', '2017-06-18 11:18:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10057', 'en_GB', 'yy-MM-dd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:52', '10001', '2017-06-18 11:21:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10057', 'zh_CN', 'yy-MM-dd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:52', '10001', '2017-06-18 11:21:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10058', 'en_GB', 'yyyy/MM/dd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:52', '10001', '2017-06-18 11:21:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10058', 'zh_CN', 'yyyy/MM/dd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:52', '10001', '2017-06-18 11:21:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10059', 'en_GB', 'yyyy-MM-dd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:52', '10001', '2017-06-18 11:21:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10059', 'zh_CN', 'yyyy-MM-dd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:52', '10001', '2017-06-18 11:21:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10060', 'en_GB', 'yyMMdd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:52', '10001', '2017-06-18 11:21:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10060', 'zh_CN', 'yyMMdd', null, '1', '-1', '-1', '10001', '2017-06-18 11:21:52', '10001', '2017-06-18 11:21:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10061', 'en_GB', '字符', null, '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:23:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10061', 'zh_CN', '字符', null, '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:23:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10062', 'en_GB', '数字', null, '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:23:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10062', 'zh_CN', '数字', null, '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:23:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10063', 'en_GB', '日期', null, '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:23:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10063', 'zh_CN', '日期', null, '1', '-1', '-1', '10001', '2017-06-18 11:23:09', '10001', '2017-06-18 11:23:09', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10064', 'en_GB', 'VALUE11', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10064', 'zh_CN', 'VALUE11', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10065', 'en_GB', 'VALUE10', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10065', 'zh_CN', 'VALUE10', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10066', 'en_GB', 'VALUE9', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10066', 'zh_CN', 'VALUE9', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10067', 'en_GB', 'VALUE8', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10067', 'zh_CN', 'VALUE8', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10068', 'en_GB', 'VALUE7', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10068', 'zh_CN', 'VALUE7', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10069', 'en_GB', 'VALUE6', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10069', 'zh_CN', 'VALUE6', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10070', 'en_GB', 'VALUE5', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10070', 'zh_CN', 'VALUE5', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10071', 'en_GB', 'VALUE4', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10071', 'zh_CN', 'VALUE4', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10072', 'en_GB', 'VALUE3', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10072', 'zh_CN', 'VALUE3', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10073', 'en_GB', 'VALUE2', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10073', 'zh_CN', 'VALUE2', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10074', 'en_GB', 'VALUE1', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10074', 'zh_CN', 'VALUE1', null, '1', '-1', '-1', '10001', '2017-06-18 11:25:12', '10001', '2017-06-18 11:25:12', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10075', 'en_GB', '源数据列', null, '1', '-1', '-1', '10001', '2017-06-18 11:26:29', '10001', '2017-06-18 11:26:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10075', 'zh_CN', '源数据列', null, '1', '-1', '-1', '10001', '2017-06-18 11:26:29', '10001', '2017-06-18 11:26:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `CONFIG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONFIG_CODE` varchar(240) NOT NULL COMMENT '配置编码',
  `CONFIG_VALUE` varchar(240) DEFAULT NULL COMMENT '配置值',
  `CATEGORY` varchar(240) DEFAULT NULL COMMENT '配置分类',
  `ENABLED_FLAG` varchar(1) DEFAULT 'Y' COMMENT '启用标记',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`CONFIG_ID`),
  UNIQUE KEY `SYS_CONFIG_U1` (`CONFIG_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('10001', 'SYS_TITLE', 'HAND Application Platform', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_config` VALUES ('10002', 'CAPTCHA', 'AFTER3', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_config` VALUES ('10003', 'DEFAULT_PASSWORD', '123456', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_config` VALUES ('10004', 'PASSWORD_MIN_LENGTH', '8', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_config` VALUES ('10005', 'PASSWORD_COMPLEXITY', 'no_limit', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_config` VALUES ('10006', 'PASSWORD_INVALID_TIME', '0', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_config` VALUES ('10007', 'USER_ROLE_MERGE', 'Y', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_config` VALUES ('10008', 'DEFAULT_TARGET_URL', '/index', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_config` VALUES ('10009', 'FIRST_LOGIN_RESET_PASSWORD', 'N', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');

-- ----------------------------
-- Table structure for sys_dashboard_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_dashboard_b`;
CREATE TABLE `sys_dashboard_b` (
  `DASHBOARD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DASHBOARD_CODE` varchar(100) NOT NULL COMMENT '仪表盘编码',
  `TITLE` varchar(100) DEFAULT NULL COMMENT '仪表盘标题',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '仪表盘描述',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`DASHBOARD_ID`),
  UNIQUE KEY `SYS_DASHBOARD_B_U1` (`DASHBOARD_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dashboard_b
-- ----------------------------
INSERT INTO `sys_dashboard_b` VALUES ('10001', 'DB_WFL_TODO', '代办事项11', '代办事项', '10178', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_dashboard_b` VALUES ('10002', 'DB_WFL_TODO2', '代办事项22', '代办事项', '10178', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_dashboard_b` VALUES ('10003', 'DB_SYS_JVM_METRICS', '系统指标', '系统指标', '10179', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');

-- ----------------------------
-- Table structure for sys_dashboard_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_dashboard_tl`;
CREATE TABLE `sys_dashboard_tl` (
  `DASHBOARD_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL COMMENT '仪表盘标题',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '仪表盘描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`DASHBOARD_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dashboard_tl
-- ----------------------------
INSERT INTO `sys_dashboard_tl` VALUES ('10001', 'en_GB', '代办事项11', '代办事项', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_dashboard_tl` VALUES ('10001', 'zh_CN', '代办事项11', '代办事项', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_dashboard_tl` VALUES ('10002', 'en_GB', '代办事项22', '代办事项', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_dashboard_tl` VALUES ('10002', 'zh_CN', '代办事项22', '代办事项', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_dashboard_tl` VALUES ('10003', 'en_GB', 'system metrics', '系统指标', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');
INSERT INTO `sys_dashboard_tl` VALUES ('10003', 'zh_CN', '系统指标', '系统指标', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `FILE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ATTACHMENT_ID` bigint(20) DEFAULT NULL COMMENT '附件ID',
  `FILE_NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `FILE_PATH` varchar(255) DEFAULT NULL COMMENT '文件虚拟路径',
  `FILE_SIZE` decimal(20,0) DEFAULT NULL COMMENT '文件大小',
  `FILE_TYPE` varchar(240) DEFAULT NULL COMMENT '文件类型',
  `UPLOAD_DATE` datetime DEFAULT NULL COMMENT '上传时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `SYS_FILE_N1` (`ATTACHMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_function_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_b`;
CREATE TABLE `sys_function_b` (
  `FUNCTION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_CODE` varchar(30) DEFAULT NULL COMMENT '模块编码',
  `FUNCTION_ICON` varchar(100) DEFAULT NULL COMMENT '功能图标',
  `FUNCTION_CODE` varchar(30) NOT NULL COMMENT '功能编码',
  `FUNCTION_NAME` varchar(150) DEFAULT NULL COMMENT '功能名称',
  `FUNCTION_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '功能入口',
  `TYPE` varchar(30) DEFAULT NULL COMMENT '功能类型',
  `PARENT_FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '父功能',
  `ENABLED_FLAG` varchar(1) DEFAULT 'Y' COMMENT '是否启用',
  `FUNCTION_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '排序号',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNCTION_ID`),
  UNIQUE KEY `SYS_FUNCTION_B_U1` (`FUNCTION_CODE`),
  KEY `SYS_FUNCTION_B_N1` (`PARENT_FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10069 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_function_b
-- ----------------------------
INSERT INTO `sys_function_b` VALUES ('10001', 'SYS', 'fa fa-gears', 'SYSTEM', '系统管理', '系统管理', null, 'PAGE', null, 'Y', '99', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10002', 'SYS', 'fa fa-edit', 'PROMPT', '描述维护', '维护描述', '10143', 'PAGE', '10001', 'Y', '20', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10003', 'SYS', 'fa fa-code', 'CODE', '代码维护', '代码维护', '10134', 'PAGE', '10001', 'Y', '30', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10004', 'SYS', 'fa fa-search', 'LOV', 'LOV定义', 'LOV定义', '10137', 'PAGE', '10001', 'Y', '40', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10005', 'SYS', 'fa fa-flag', 'LANGUAGE', '语言维护', '语言维护', '10075', 'PAGE', '10001', 'Y', '50', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10006', 'SYS', 'fa fa-cogs', 'PROFILE', '配置维护', '配置维护', '10141', 'PAGE', '10001', 'Y', '50', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10007', 'SYSCONFIG', 'fa fa-cog', 'SYS_CONFIG', '系统配置', '系统配置', '10136', 'PAGE', '10001', 'Y', '6', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10008', 'ACCOUNT', 'fa fa-user', 'ACCOUNT', '账户管理', '账户管理', null, 'PAGE', '10001', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10009', 'ACCOUNT', 'fa fa-user-plus', 'ACCOUNT_USER', '用户管理', '用户管理', '10148', 'PAGE', '10008', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10010', 'ACCOUNT', 'fa fa-users', 'ACCOUNT_ROLE', '角色管理', '角色管理', '10144', 'PAGE', '10008', 'Y', '20', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10011', 'FUNCTION', 'fa fa-plug', 'FUNCTION', '功能管理', '功能管理', null, 'PAGE', '10001', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10012', 'FUNCTION', 'fa fa-puzzle-piece', 'FUNCTION_ADD', '功能维护', '功能定义', '10065', 'PAGE', '10011', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10013', 'FUNCTION', 'fa fa-share-alt-square', 'SYS_RESOURCE', '资源管理', '资源管理', '10115', 'PAGE', '10011', 'Y', '20', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10014', 'FUNCTION', 'fa fa-list', 'FUNCTION_ASSIGN', '功能分配', '功能分配', '10129', 'PAGE', '10011', 'Y', '90', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10015', 'JOB', 'fa fa-clock-o', 'JOB', '计划任务', '计划任务', null, 'PAGE', null, 'Y', '40', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10016', 'JOB', 'fa fa-tasks', 'JOB_DETAIL', '任务明细', '任务明细', '10023', 'PAGE', '10015', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10017', 'JOB', 'fa fa-list-ul', 'JOB_RUNNING_INFO', '执行记录', '执行记录', '10033', 'PAGE', '10015', 'Y', '20', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10018', 'ATTACH', 'fa fa-cloud-upload', 'ATTACH', '附件管理', '附件管理', null, 'PAGE', null, 'Y', '30', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10019', 'ATTACH', 'fa fa-file', 'ATTACH_FILE', '文件管理', '文件管理', '10049', 'PAGE', '10018', 'Y', '20', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10020', 'ATTACH', 'fa fa-file', 'ATTACH_TEST', '上传测试', '上传测试', '10058', 'PAGE', '10018', 'Y', '30', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10021', 'ATTACH', 'fa fa-folder-open', 'ATTACH_CATEGORY', '目录管理', '目录管理', '10045', 'PAGE', '10018', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10022', 'EMAIL', 'fa fa-envelope', 'EMAIL', '邮件', '邮件', null, 'PAGE', '10001', 'Y', '80', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10023', 'EMAIL', 'fa fa-envelope', 'EMAIL_ACCOUNT', '邮件账户', '邮件账户', '10085', 'PAGE', '10022', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10024', 'EMAIL', 'fa fa-envelope', 'EMAIL_TEMPLATE', '邮件模板', '邮件模板', '10096', 'PAGE', '10022', 'Y', '20', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10025', 'EMAIL', 'fa fa-envelope', 'EMAIL_TEST', '邮件测试', '邮件测试', '10102', 'PAGE', '10022', 'Y', '30', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10026', 'WFL', 'fa fa-sitemap', 'WFL', '工作流', '工作流', null, 'PAGE', null, 'Y', '40', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10027', 'WFL', 'fa fa-check-square-o', 'WFL_MY_TASK', '我的待办', '个人待办列表', '10005', 'PAGE', '10026', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10028', 'WFL', 'fa fa-check-square-o', 'WFL_TASK', '待办事项(管理员)', '待办事项', '10009', 'PAGE', '10026', 'Y', '20', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10029', 'WFL', 'fa fa-history', 'WFL_HISROTY', '历史流程', '历史流程', '10007', 'PAGE', '10026', 'Y', '30', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10030', 'WFL', 'fa fa-object-group', 'WFL_MODEL', '流程设计', '模型管理', '10004', 'PAGE', '10026', 'Y', '40', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10031', 'WFL', 'fa fa-wrench', 'WFL_TEST', '工作流测试', '工作流测试', '10008', 'PAGE', '10026', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10032', 'WFL', 'fa fa-share-alt', 'WFL_DEFINITION', '流程部署', '流程部署', '10006', 'PAGE', '10026', 'Y', '50', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10033', 'HR', 'fa fa-cubes', 'HR', '组织架构', '组织架构', null, 'PAGE', null, 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10034', 'HR', 'fa fa-cube', 'HR_UNIT', '组织管理', '组织管理', '10018', 'PAGE', '10033', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10035', 'HR', 'fa fa-user', 'HR_EMPLOYEE', '员工管理', '员工管理', '10011', 'PAGE', '10033', 'Y', '30', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10036', 'HR', 'fa fa-user-secret', 'HR_POSITION', '岗位管理', '岗位管理', '10014', 'PAGE', '10033', 'Y', '20', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10037', 'FND', 'fa fa-cube', 'FND_COMPANY', '公司管理', '公司管理', '10169', 'PAGE', '10033', 'Y', '40', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10038', 'SYS', 'fa fa-dashboard', 'SYS_DASHBOARD', '仪表盘配置', '仪表盘配置', '10174', 'PAGE', '10001', 'Y', '15', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10039', 'EMAIL', 'fa fa-envelope', 'EMAIL_STATUS', '邮件状态查询', '邮件状态查询', '10180', 'PAGE', '10022', 'Y', '40', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10040', 'IF', 'fa fa-plug', 'IF', '接口管理', '接口管理', null, 'PAGE', null, 'Y', '80', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10041', 'IF', 'fa fa-share-alt-square', 'IF_CONFIG', '接口定义', '接口定义', '10182', 'PAGE', '10040', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10042', 'IF', 'fa fa-bar-chart', 'IF_INVOKE', '调用记录', '调用记录', '10181', 'PAGE', '10040', 'Y', '20', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10043', 'SYS', 'fa fa-heartbeat', 'SYS_METRICS', '系统指标', '系统指标', '10185', 'PAGE', '10001', 'Y', '10', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10057', 'TESTMODEL', 'fa fa-user', 'TESTMODEL', '测试模块', '测试模块', null, 'PAGE', null, 'Y', '10', '1', '-1', '-1', '10001', '2017-03-31 19:59:11', '10001', '2017-03-31 19:59:11', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10058', 'TESTMODEL', 'fa fa-user', 'TESTMODEL_GOODS', '测试模块商品', '测试模块商品', '10196', 'PAGE', '10057', 'Y', '10', '1', '-1', '-1', '10001', '2017-03-31 20:01:52', '10001', '2017-03-31 20:01:52', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10059', 'TESTMODEL', 'fa fa-user', 'TESTMODEL_USER', '测试模块用户', '测试模块用户', '10195', 'PAGE', '10057', 'Y', '10', '1', '-1', '-1', '10001', '2017-03-31 20:03:38', '10001', '2017-03-31 20:03:38', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10060', 'SALE', 'fa fa-folder-open', 'SALE', '销售订单管理', '销售订单管理', null, 'PAGE', null, 'Y', '10', '1', '-1', '-1', '10001', '2017-04-01 09:58:31', '10001', '2017-04-01 09:58:31', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10061', 'SALE', 'fa fa-file', 'SALESUMPAGES', '销售订单汇总', '销售订单汇总', '10199', 'PAGE', '10060', 'Y', '10', '2', '-1', '-1', '10001', '2017-04-01 10:01:16', '10001', '2017-04-01 10:09:06', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10062', 'SALE', 'fa fa-user', 'SALEDETAILS', '销售订单明细', '销售订单明细', '10200', 'PAGE', '10060', 'Y', '10', '2', '-1', '-1', '10001', '2017-04-01 12:32:36', '10001', '2017-04-04 20:37:00', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10063', '1', 'fa fa-cogs', '1', '1', '1', '10203', 'PAGE', '10060', 'Y', '10', '2', '-1', '-1', '10001', '2017-04-04 11:14:34', '10001', '2017-04-19 16:18:56', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10064', '2', '', '2', '2', '2', '10204', 'PAGE', '10060', 'Y', '10', '1', '-1', '-1', '10001', '2017-04-05 13:11:31', '10001', '2017-04-05 13:11:31', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10065', 'SALE', 'fa fa-user', 'SALES', '销售汇总页面', '销售汇总', '10204', 'PAGE', '10060', 'Y', '10', '2', '-1', '-1', '10001', '2017-04-05 14:17:53', '10001', '2017-04-05 14:55:37', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10066', 'BASESET', 'fa fa-cogs', 'BASESET', '基础设置', '基础设置', null, 'PAGE', null, 'Y', '10', '1', '-1', '-1', '10001', '2017-04-19 16:18:57', '10001', '2017-04-19 16:18:57', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10067', 'TRANSACTIONTYPE', 'fa fa-share-alt', 'TRANSACTIONTYPE', '事务类型', '事务类型', '10215', 'PAGE', '10066', 'Y', '10', '10', '-1', '-1', '10001', '2017-04-19 16:22:34', '10001', '2017-06-17 13:32:08', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10068', 'CISI', 'fa fa-sitemap', 'CISI', '通用接口设置界面', '通用接口设置界面', '10217', 'PAGE', '10066', 'Y', '10', '5', '-1', '-1', '10001', '2017-04-19 16:27:04', '10001', '2017-06-17 13:56:48', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_function_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_resource`;
CREATE TABLE `sys_function_resource` (
  `FUNC_SRC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '外键，功能 ID',
  `RESOURCE_ID` bigint(20) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNC_SRC_ID`),
  UNIQUE KEY `SYS_FUNCTION_RESOURCE_U1` (`FUNCTION_ID`,`RESOURCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_function_resource
-- ----------------------------
INSERT INTO `sys_function_resource` VALUES ('10001', '10002', '10143', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10002', '10002', '10112', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10003', '10002', '10113', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10004', '10002', '10114', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10005', '10003', '10134', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10006', '10003', '10135', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10007', '10003', '10060', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10008', '10003', '10061', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10009', '10003', '10062', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10010', '10003', '10063', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10011', '10003', '10064', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10012', '10004', '10137', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10013', '10004', '10138', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10014', '10004', '10139', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10015', '10004', '10079', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10016', '10004', '10080', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10017', '10004', '10081', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10018', '10004', '10082', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10019', '10004', '10083', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10020', '10004', '10084', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10021', '10006', '10141', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10022', '10006', '10142', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10023', '10006', '10106', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10024', '10006', '10107', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10025', '10006', '10108', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10026', '10006', '10109', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10027', '10006', '10110', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10028', '10006', '10111', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10029', '10012', '10065', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10030', '10012', '10066', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10031', '10012', '10067', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10032', '10012', '10068', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10033', '10012', '10069', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10034', '10012', '10070', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10035', '10012', '10071', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10036', '10012', '10072', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10037', '10012', '10073', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10038', '10012', '10074', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10039', '10016', '10023', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10040', '10016', '10024', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10041', '10016', '10025', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10042', '10016', '10026', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10043', '10016', '10027', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10044', '10016', '10028', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10045', '10016', '10029', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10046', '10016', '10030', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10047', '10016', '10031', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10048', '10016', '10032', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10049', '10013', '10115', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10050', '10013', '10120', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10051', '10013', '10121', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10052', '10013', '10122', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10053', '10013', '10123', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10054', '10013', '10124', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10055', '10013', '10125', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10056', '10013', '10126', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10057', '10013', '10127', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10058', '10014', '10129', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10059', '10014', '10130', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10060', '10014', '10131', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10061', '10014', '10132', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10062', '10014', '10133', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10063', '10014', '10121', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10064', '10009', '10148', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10065', '10009', '10149', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10066', '10009', '10150', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10067', '10009', '10151', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10068', '10009', '10152', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10069', '10009', '10153', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10070', '10009', '10154', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10071', '10009', '10155', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10072', '10009', '10128', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10073', '10009', '10156', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10074', '10010', '10144', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10075', '10010', '10145', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10076', '10010', '10146', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10077', '10010', '10147', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10078', '10017', '10033', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10079', '10017', '10034', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10080', '10005', '10075', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10081', '10005', '10076', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10082', '10005', '10077', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10083', '10005', '10078', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10084', '10023', '10085', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10085', '10023', '10086', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10086', '10023', '10087', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10087', '10023', '10088', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10088', '10023', '10089', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10089', '10023', '10090', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10090', '10023', '10091', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10091', '10023', '10092', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10092', '10023', '10093', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10093', '10023', '10094', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10094', '10023', '10095', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10095', '10024', '10096', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10096', '10024', '10097', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10097', '10024', '10098', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10098', '10024', '10099', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10099', '10024', '10100', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10100', '10024', '10101', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10101', '10025', '10102', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10102', '10025', '10103', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10103', '10021', '10044', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10104', '10021', '10045', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10105', '10021', '10046', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10106', '10021', '10047', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10107', '10021', '10048', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10108', '10019', '10049', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10109', '10019', '10050', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10110', '10019', '10051', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10111', '10019', '10052', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10112', '10019', '10053', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10113', '10019', '10054', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10114', '10019', '10055', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10115', '10019', '10056', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10116', '10019', '10057', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10117', '10020', '10058', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10118', '10020', '10059', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10119', '10031', '10008', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10120', '10032', '10006', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10121', '10028', '10009', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10122', '10029', '10007', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10123', '10030', '10004', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10124', '10027', '10005', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10125', '10007', '10136', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10126', '10034', '10018', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10127', '10034', '10019', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10128', '10034', '10020', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10129', '10034', '10021', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10130', '10035', '10011', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10131', '10035', '10012', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10132', '10035', '10013', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10133', '10036', '10014', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10134', '10036', '10015', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10135', '10036', '10016', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10136', '10036', '10017', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10137', '10037', '10169', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10138', '10037', '10170', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10139', '10037', '10171', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10140', '10037', '10172', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10141', '10037', '10173', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10142', '10038', '10174', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10143', '10038', '10175', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10144', '10038', '10176', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10145', '10038', '10177', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10146', '10041', '10182', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10147', '10041', '10183', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10148', '10041', '10184', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10149', '10042', '10181', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10150', '10043', '10185', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10151', '10039', '10187', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10152', '10039', '10186', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10153', '10039', '10180', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10154', '10013', '10116', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10155', '10013', '10117', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10156', '10013', '10118', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10157', '10013', '10119', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10158', '10009', '10188', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_function_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_tl`;
CREATE TABLE `sys_function_tl` (
  `FUNCTION_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `FUNCTION_NAME` varchar(150) DEFAULT NULL COMMENT '功能名',
  `FUNCTION_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '功能描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNCTION_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_function_tl
-- ----------------------------
INSERT INTO `sys_function_tl` VALUES ('10001', 'en_GB', 'System', 'System', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10001', 'zh_CN', '系统管理', '系统管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10002', 'en_GB', 'Prompt', 'Prompts', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10002', 'zh_CN', '描述维护', '维护描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10003', 'en_GB', 'Code', 'Lookup Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10003', 'zh_CN', '代码维护', '代码维护', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10004', 'en_GB', 'LOV', 'LOV', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10004', 'zh_CN', 'LOV定义', 'LOV定义', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10005', 'en_GB', 'Languages', 'Language', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10005', 'zh_CN', '语言维护', '语言维护', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10006', 'en_GB', 'Profile', 'Profiles', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10006', 'zh_CN', '配置维护', '配置维护', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10007', 'en_GB', 'System Config', 'System Config', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10007', 'zh_CN', '系统配置', '系统配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10008', 'en_GB', 'Account', 'Account', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10008', 'zh_CN', '账户管理', '账户管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10009', 'en_GB', 'User', 'Users', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10009', 'zh_CN', '用户管理', '用户管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10010', 'en_GB', 'Role', 'Roles', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10010', 'zh_CN', '角色管理', '角色管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10011', 'en_GB', 'Function', 'Functions', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10011', 'zh_CN', '功能管理', '功能管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10012', 'en_GB', 'Function Definition', 'Function Define', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10012', 'zh_CN', '功能维护', '功能定义', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10013', 'en_GB', 'Resource', 'Resources', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10013', 'zh_CN', '资源管理', '资源管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10014', 'en_GB', 'Function Assign', 'Function', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10014', 'zh_CN', '功能分配', '功能分配', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10015', 'en_GB', 'Task', 'Job', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10015', 'zh_CN', '计划任务', '计划任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10016', 'en_GB', 'Task Detail', 'Job Detail', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10016', 'zh_CN', '任务明细', '任务明细', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10017', 'en_GB', 'Execution Log', 'Execution Log', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10017', 'zh_CN', '执行记录', '执行记录', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10018', 'en_GB', 'Attachment', 'Attachment', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10018', 'zh_CN', '附件管理', '附件管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10019', 'en_GB', 'Files', 'Files', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10019', 'zh_CN', '文件管理', '文件管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10020', 'en_GB', 'Upload Test', 'Upload Test', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10020', 'zh_CN', '上传测试', '上传测试', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10021', 'en_GB', 'Category', 'Category', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10021', 'zh_CN', '目录管理', '目录管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10022', 'en_GB', 'Email', 'Email', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10022', 'zh_CN', '邮件', '邮件', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10023', 'en_GB', 'Email Account', 'Email Account', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10023', 'zh_CN', '邮件账户', '邮件账户', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10024', 'en_GB', 'Email Template', 'Email Template', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10024', 'zh_CN', '邮件模板', '邮件模板', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10025', 'en_GB', 'Email Test', 'Email Test', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10025', 'zh_CN', '邮件测试', '邮件测试', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10026', 'en_GB', 'Workflow', 'Workflow', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10026', 'zh_CN', '工作流', '工作流', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10027', 'en_GB', 'My Tasks', 'Personal Task List', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10027', 'zh_CN', '我的待办', '个人待办列表', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10028', 'en_GB', 'Tasks (ADMIN)', 'Task', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10028', 'zh_CN', '待办事项(管理员)', '待办事项', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10029', 'en_GB', 'Process History', 'Process History', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10029', 'zh_CN', '历史流程', '历史流程', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10030', 'en_GB', 'Model Design', 'Models', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10030', 'zh_CN', '流程设计', '模型管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10031', 'en_GB', 'Test', 'Test', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10031', 'zh_CN', '工作流测试', '工作流测试', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10032', 'en_GB', 'Definition', 'Definition', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10032', 'zh_CN', '流程部署', '流程部署', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10033', 'en_GB', '组织架构', '组织架构', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10033', 'zh_CN', '组织架构', '组织架构', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10034', 'en_GB', 'unit manage', 'unit manage', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10034', 'zh_CN', '组织管理', '组织管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10035', 'en_GB', 'Employee Mgr', 'Employee Management', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10035', 'zh_CN', '员工管理', '员工管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10036', 'en_GB', 'Position Mgr', 'Management', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10036', 'zh_CN', '岗位管理', '岗位管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10037', 'en_GB', 'Company Mgr', 'Company Management', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10037', 'zh_CN', '公司管理', '公司管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10038', 'en_GB', 'Dashboard Config', 'Dashboard Config', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10038', 'zh_CN', '仪表盘配置', '仪表盘配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10039', 'en_GB', 'Email Status', 'Email Status', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10039', 'zh_CN', '邮件状态查询', '邮件状态查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10040', 'en_GB', 'Interface Management', 'Interface Management', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10040', 'zh_CN', '接口管理', '接口管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10041', 'en_GB', 'Interface Definition', 'Interface Definition', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10041', 'zh_CN', '接口定义', '接口定义', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10042', 'en_GB', 'Invoke Records', 'Invoke Records', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10042', 'zh_CN', '调用记录', '调用记录', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10043', 'en_GB', 'System Metrics', 'System Metrics', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10043', 'zh_CN', '系统指标', '系统指标', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10057', 'en_GB', 'testModel', 'testModel', '1', '-1', '-1', '10001', '2017-03-31 19:59:11', '10001', '2017-03-31 19:59:11', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10057', 'zh_CN', '测试模块', '测试模块', '1', '-1', '-1', '10001', '2017-03-31 19:59:11', '10001', '2017-03-31 19:59:11', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10058', 'en_GB', 'testModelGoods', 'testModelGoods', '1', '-1', '-1', '10001', '2017-03-31 20:01:52', '10001', '2017-03-31 20:01:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10058', 'zh_CN', '测试模块商品', '测试模块商品', '1', '-1', '-1', '10001', '2017-03-31 20:01:52', '10001', '2017-03-31 20:01:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10059', 'en_GB', 'testModelUser', 'testModelUser', '1', '-1', '-1', '10001', '2017-03-31 20:03:37', '10001', '2017-03-31 20:03:37', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10059', 'zh_CN', '测试模块用户', '测试模块用户', '1', '-1', '-1', '10001', '2017-03-31 20:03:37', '10001', '2017-03-31 20:03:37', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10060', 'en_GB', 'saleManage', 'saleManage', '1', '-1', '-1', '10001', '2017-04-01 09:58:30', '10001', '2017-04-01 09:58:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10060', 'zh_CN', '销售订单管理', '销售订单管理', '1', '-1', '-1', '10001', '2017-04-01 09:58:30', '10001', '2017-04-01 09:58:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10061', 'en_GB', 'saleSum', 'saleSumPages', '1', '-1', '-1', '10001', '2017-04-01 10:01:15', '10001', '2017-04-01 10:09:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10061', 'zh_CN', '销售订单汇总', '销售订单汇总', '1', '-1', '-1', '10001', '2017-04-01 10:01:15', '10001', '2017-04-01 10:09:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10062', 'en_GB', 'saleOrderDetails', 'saleDetails', '1', '-1', '-1', '10001', '2017-04-01 12:32:35', '10001', '2017-04-04 20:37:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10062', 'zh_CN', '销售订单明细', '销售订单明细', '1', '-1', '-1', '10001', '2017-04-01 12:32:35', '10001', '2017-04-04 20:37:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10063', 'en_GB', '1', '1', '1', '-1', '-1', '10001', '2017-04-04 11:14:33', '10001', '2017-04-04 11:14:33', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10063', 'zh_CN', '1', '1', '1', '-1', '-1', '10001', '2017-04-04 11:14:33', '10001', '2017-04-19 16:18:56', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10064', 'en_GB', '2', '2', '1', '-1', '-1', '10001', '2017-04-05 13:11:31', '10001', '2017-04-05 13:11:31', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10064', 'zh_CN', '2', '2', '1', '-1', '-1', '10001', '2017-04-05 13:11:31', '10001', '2017-04-05 13:11:31', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10065', 'en_GB', '销售汇总', '销售汇总', '1', '-1', '-1', '10001', '2017-04-05 14:17:53', '10001', '2017-04-05 14:17:53', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10065', 'zh_CN', '销售汇总页面', '销售汇总', '1', '-1', '-1', '10001', '2017-04-05 14:17:53', '10001', '2017-04-05 14:55:37', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10066', 'en_GB', 'baseSet', 'baseSet', '1', '-1', '-1', '10001', '2017-04-19 16:18:56', '10001', '2017-04-19 16:18:56', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10066', 'zh_CN', '基础设置', '基础设置', '1', '-1', '-1', '10001', '2017-04-19 16:18:56', '10001', '2017-04-19 16:18:56', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10067', 'en_GB', 'transactionType', 'transactionType', '1', '-1', '-1', '10001', '2017-04-19 16:22:34', '10001', '2017-04-19 16:24:18', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10067', 'zh_CN', '事务类型', '事务类型', '1', '-1', '-1', '10001', '2017-04-19 16:22:34', '10001', '2017-06-17 13:32:08', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10068', 'en_GB', 'CommonInterfaceSettingsInterface', 'commonInterfaceSettingInterface', '1', '-1', '-1', '10001', '2017-04-19 16:27:04', '10001', '2017-04-19 16:27:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10068', 'zh_CN', '通用接口设置界面', '通用接口设置界面', '1', '-1', '-1', '10001', '2017-04-19 16:27:04', '10001', '2017-06-17 13:56:48', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_if_config_header_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_config_header_b`;
CREATE TABLE `sys_if_config_header_b` (
  `HEADER_ID` varchar(255) NOT NULL,
  `INTERFACE_CODE` varchar(30) NOT NULL COMMENT '系统代码',
  `INTERFACE_TYPE` varchar(10) NOT NULL COMMENT '接口类型',
  `DOMAIN_URL` varchar(200) NOT NULL COMMENT '系统地址',
  `BODY_HEADER` varchar(2000) DEFAULT NULL COMMENT 'SOAP报文前缀',
  `BODY_TAIL` varchar(2000) DEFAULT NULL COMMENT 'SOAP报文后缀',
  `NAMESPACE` varchar(30) DEFAULT NULL COMMENT 'SOAP命名空间',
  `REQUEST_METHOD` varchar(10) NOT NULL COMMENT '请求方法',
  `REQUEST_FORMAT` varchar(30) NOT NULL COMMENT '请求形式',
  `REQUEST_CONTENTTYPE` varchar(80) DEFAULT NULL COMMENT '请求报文格式',
  `REQUEST_ACCEPT` varchar(80) DEFAULT NULL COMMENT '请求接收类型',
  `AUTH_FLAG` varchar(1) NOT NULL COMMENT '是否需要验证',
  `AUTH_USERNAME` varchar(80) DEFAULT NULL COMMENT '校验用户名',
  `AUTH_PASSWORD` varchar(200) DEFAULT NULL COMMENT '校验密码',
  `ENABLE_FLAG` varchar(1) NOT NULL COMMENT '是否有效',
  `NAME` varchar(200) NOT NULL COMMENT '系统名称',
  `DESCRIPTION` varchar(255) NOT NULL COMMENT '系统描述',
  `SYSTEM_TYPE` varchar(10) DEFAULT NULL COMMENT '系统类型',
  `MAPPER_CLASS` varchar(255) DEFAULT NULL COMMENT '包装类',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`HEADER_ID`),
  UNIQUE KEY `SYS_IF_CONFIG_HEADER_U1` (`INTERFACE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_config_header_b
-- ----------------------------

-- ----------------------------
-- Table structure for sys_if_config_header_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_config_header_tl`;
CREATE TABLE `sys_if_config_header_tl` (
  `HEADER_ID` varchar(255) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL COMMENT '系统名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '系统描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`HEADER_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_config_header_tl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_if_config_line_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_config_line_b`;
CREATE TABLE `sys_if_config_line_b` (
  `LINE_ID` varchar(255) NOT NULL,
  `HEADER_ID` varchar(255) NOT NULL COMMENT '行Id',
  `LINE_CODE` varchar(30) NOT NULL COMMENT '接口代码',
  `IFT_URL` varchar(200) NOT NULL COMMENT '接口地址',
  `ENABLE_FLAG` varchar(1) NOT NULL COMMENT '是否有效',
  `LINE_NAME` varchar(50) DEFAULT NULL COMMENT '接口名称',
  `LINE_DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '接口描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`LINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_config_line_b
-- ----------------------------

-- ----------------------------
-- Table structure for sys_if_config_line_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_config_line_tl`;
CREATE TABLE `sys_if_config_line_tl` (
  `LINE_ID` varchar(255) NOT NULL DEFAULT '',
  `LANG` varchar(50) NOT NULL,
  `LINE_NAME` varchar(50) DEFAULT NULL COMMENT '接口名称',
  `LINE_DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '接口描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`LINE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_config_line_tl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_if_invoke_inbound
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_invoke_inbound`;
CREATE TABLE `sys_if_invoke_inbound` (
  `INBOUND_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INTERFACE_NAME` varchar(255) NOT NULL COMMENT '接口名称',
  `INTERFACE_URL` varchar(200) NOT NULL COMMENT '接口地址',
  `REQUEST_TIME` datetime NOT NULL COMMENT '请求时间',
  `REQUEST_HEADER_PARAMETER` varchar(2000) DEFAULT NULL COMMENT '请求header参数',
  `REQUEST_BODY_PARAMETER` longtext COMMENT '请求body参数',
  `REQUEST_METHOD` varchar(10) DEFAULT NULL COMMENT '请求方式',
  `REQUEST_STATUS` varchar(10) DEFAULT NULL COMMENT '请求状态',
  `RESPONSE_CONTENT` longtext COMMENT '响应内容',
  `RESPONSE_TIME` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `STACKTRACE` longtext COMMENT '错误堆栈',
  `IP` varchar(40) DEFAULT NULL COMMENT 'ip地址',
  `REFERER` varchar(240) DEFAULT NULL,
  `USER_AGENT` varchar(240) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`INBOUND_ID`),
  KEY `SYS_IF_INVOKE_INBOUND_N1` (`INTERFACE_NAME`),
  KEY `SYS_IF_INVOKE_INBOUND_N2` (`INTERFACE_URL`),
  KEY `SYS_IF_INVOKE_INBOUND_N3` (`REQUEST_TIME`),
  KEY `SYS_IF_INVOKE_INBOUND_N4` (`REQUEST_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_invoke_inbound
-- ----------------------------

-- ----------------------------
-- Table structure for sys_if_invoke_outbound
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_invoke_outbound`;
CREATE TABLE `sys_if_invoke_outbound` (
  `OUTBOUND_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INTERFACE_NAME` varchar(255) NOT NULL COMMENT '接口名称',
  `INTERFACE_URL` varchar(200) NOT NULL COMMENT '接口地址',
  `REQUEST_TIME` datetime NOT NULL COMMENT '请求时间',
  `REQUEST_PARAMETER` longtext COMMENT '请求参数',
  `REQUEST_STATUS` varchar(10) DEFAULT NULL COMMENT '请求状态',
  `RESPONSE_CONTENT` longtext COMMENT '响应内容',
  `RESPONSE_TIME` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `RESPONSE_CODE` varchar(30) DEFAULT NULL COMMENT 'httpCode',
  `STACKTRACE` longtext COMMENT '错误堆栈',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`OUTBOUND_ID`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N1` (`INTERFACE_NAME`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N2` (`INTERFACE_URL`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N3` (`REQUEST_TIME`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N4` (`REQUEST_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_invoke_outbound
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job_running_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_running_info`;
CREATE TABLE `sys_job_running_info` (
  `JOB_RUNNING_INFO_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(225) DEFAULT NULL,
  `JOB_GROUP` varchar(225) DEFAULT NULL,
  `JOB_RESULT` varchar(225) DEFAULT NULL,
  `JOB_STATUS` varchar(225) DEFAULT NULL,
  `JOB_STATUS_MESSAGE` varchar(225) DEFAULT NULL,
  `TRIGGER_NAME` varchar(225) DEFAULT NULL,
  `TRIGGER_GROUP` varchar(225) DEFAULT NULL,
  `PREVIOUS_FIRE_TIME` datetime DEFAULT NULL,
  `FIRE_TIME` datetime DEFAULT NULL,
  `NEXT_FIRE_TIME` datetime DEFAULT NULL,
  `REFIRE_COUNT` bigint(20) DEFAULT '0',
  `FIRE_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULER_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULED_FIRE_TIME` datetime DEFAULT NULL,
  `EXECUTION_SUMMARY` varchar(225) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`JOB_RUNNING_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_job_running_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_lang_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_lang_b`;
CREATE TABLE `sys_lang_b` (
  `LANG_CODE` varchar(10) NOT NULL,
  `BASE_LANG` varchar(10) DEFAULT NULL COMMENT '基语言',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `JOB_RESULT` varchar(225) DEFAULT NULL,
  `JOB_STATUS` varchar(225) DEFAULT NULL,
  `JOB_STATUS_MESSAGE` varchar(225) DEFAULT NULL,
  `TRIGGER_NAME` varchar(225) DEFAULT NULL,
  `TRIGGER_GROUP` varchar(225) DEFAULT NULL,
  `PREVIOUS_FIRE_TIME` datetime DEFAULT NULL,
  `FIRE_TIME` datetime DEFAULT NULL,
  `NEXT_FIRE_TIME` datetime DEFAULT NULL,
  `REFIRE_COUNT` bigint(20) DEFAULT '0',
  `FIRE_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULER_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULED_FIRE_TIME` datetime DEFAULT NULL,
  `EXECUTION_SUMMARY` varchar(225) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LANG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_lang_b
-- ----------------------------
INSERT INTO `sys_lang_b` VALUES ('en_GB', 'zh_CN', 'English', null, null, null, null, null, null, null, null, '0', null, null, null, null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lang_b` VALUES ('zh_CN', 'zh_CN', '简体中文', null, null, null, null, null, null, null, null, '0', null, null, null, null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_lov
-- ----------------------------
DROP TABLE IF EXISTS `sys_lov`;
CREATE TABLE `sys_lov` (
  `LOV_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(80) NOT NULL COMMENT 'LOV的code',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `SQL_ID` varchar(225) DEFAULT NULL COMMENT 'SQL ID',
  `VALUE_FIELD` varchar(80) DEFAULT NULL COMMENT ' VALUE_FIELD',
  `TEXT_FIELD` varchar(80) DEFAULT NULL COMMENT 'TEXT_FIELD',
  `TITLE` varchar(225) DEFAULT NULL COMMENT '标题',
  `WIDTH` decimal(20,0) DEFAULT NULL COMMENT '宽度',
  `HEIGHT` decimal(20,0) DEFAULT NULL COMMENT '高度',
  `PLACEHOLDER` varchar(80) DEFAULT NULL COMMENT '提示',
  `DELAY_LOAD` varchar(1) DEFAULT 'N' COMMENT '是否延迟加载',
  `NEED_QUERY_PARAM` varchar(1) DEFAULT 'N' COMMENT '是否需要查询条件',
  `EDITABLE` varchar(1) DEFAULT 'N' COMMENT '是否可编辑',
  `CAN_POPUP` varchar(1) DEFAULT 'Y' COMMENT '是否可弹出',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `CUSTOM_SQL` longtext COMMENT '自定义sql',
  `QUERY_COLUMNS` int(11) DEFAULT '1' COMMENT '查询框列数',
  `CUSTOM_URL` varchar(255) DEFAULT NULL COMMENT '自定义URL',
  PRIMARY KEY (`LOV_ID`),
  UNIQUE KEY `SYS_LOV_U1` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10016 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_lov
-- ----------------------------
INSERT INTO `sys_lov` VALUES ('10001', 'user_lov', '查询用户', 'UserMapper.select', 'userId', 'userName', '查询用户', '400', '400', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10002', 'ATTACH_SOURCE_TYPE', '附件来源类型选择', 'AttachCategoryMapper.selectAllLeafCategory', 'sourceType', 'sourceType', 'attachcategory.sourcetype', '450', '200', 'attachcategory.sourcetype', 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10003', 'LOV_PARENTFUNCTION', null, 'FunctionMapper.select', 'functionId', 'functionName', 'function.parentfunctionid', '550', '350', 'function.parentfunctionid', 'N', 'N', 'N', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10004', 'LOV_ROLE', '选择角色', 'RoleMapper.select', 'roleId', 'roleName', null, '450', '300', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10005', 'LOV_RESOURCE', '选择资源', 'ResourceMapper.select', 'resourceId', 'name', null, '500', '300', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10006', 'LOV_PARENTPOSITION', '上级岗位', 'PositionMapper.selectParentPositionName', 'positionId', 'name', 'position.parentpositionname', '500', '400', 'position.parentpositionname', 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10007', 'LOV_UNIT', '部门', 'OrgUnitMapper.select', 'unitId', 'name', 'hrorgunit.parentname', '500', '400', 'hrorgunit.parentname', 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10008', 'LOV_POSITION', '选择岗位', 'PositionMapper.select', 'positionId', 'name', 'position.name', '500', '200', 'position.name', 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10009', 'LOV_COMPANY', '选择公司', 'CompanyMapper.select', 'companyId', 'companyFullName', null, '500', '200', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10010', 'MESSAGE_TEMPLATE', '选择模板', 'MessageTemplateMapper.select', 'templateCode', 'templateCode', null, '500', '200', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10011', 'MESSAGE_ACCOUNT', '邮件账户', 'MessageEmailAccountMapper.selectMessageEmailAccounts', 'accountCode', 'userName', null, '500', '200', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10012', 'WFL_POSITION_LOV', '工作流选择岗位', 'PositionMapper.select', 'positionCode', 'name', 'position.name', '500', '200', 'position.name', 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `sys_lov` VALUES ('10013', 'LOV_COMPANYS', 'LOV_COMPANYS', 'CompanysMapper.select', 'companyId', 'companyName', null, '450', '350', null, 'N', 'N', 'N', 'Y', '13', '-1', '-1', '10001', '2017-04-02 14:22:25', '10001', '2017-04-07 13:21:44', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '1', '');
INSERT INTO `sys_lov` VALUES ('10014', 'LOV_ITEM', 'LOV_ITEM', 'ItemMapper.select', 'inventoryItemId', 'itemDescription', null, '450', '300', null, 'N', 'N', 'N', 'Y', '11', '-1', '-1', '10001', '2017-04-02 14:37:41', '10001', '2017-04-09 22:25:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '1', '');
INSERT INTO `sys_lov` VALUES ('10015', 'LOV_CUSTOMER', 'LOV_CUSTOMER', 'CustomerMapper.select', 'customerId', 'customerName', null, '450', '350', null, 'N', 'N', 'N', 'Y', '12', '-1', '-1', '10001', '2017-04-02 14:53:28', '10001', '2017-04-06 17:57:56', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '1', '');

-- ----------------------------
-- Table structure for sys_lov_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_lov_item`;
CREATE TABLE `sys_lov_item` (
  `LOV_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LOV_ID` bigint(20) DEFAULT NULL COMMENT '头表ID',
  `DISPLAY` varchar(255) DEFAULT NULL COMMENT '描述字段',
  `IS_AUTOCOMPLETE` varchar(1) DEFAULT 'N' COMMENT '是否autocomplete',
  `CONDITION_FIELD` varchar(80) DEFAULT 'N' COMMENT ' 是否查询字段',
  `CONDITION_FIELD_WIDTH` decimal(20,0) DEFAULT NULL COMMENT '查询字段宽度',
  `CONDITION_FIELD_TYPE` varchar(30) DEFAULT NULL COMMENT '查询字段组件类型',
  `CONDITION_FIELD_NAME` varchar(80) DEFAULT NULL COMMENT '查询字段名',
  `CONDITION_FIELD_NEWLINE` varchar(1) DEFAULT NULL COMMENT '查询字段新一行',
  `CONDITION_FIELD_SELECT_CODE` varchar(80) DEFAULT NULL COMMENT '查询字段combobox对应的快码值',
  `CONDITION_FIELD_LOV_CODE` varchar(80) DEFAULT NULL COMMENT '查询字段lov对应的通用lov编码',
  `CONDITION_FIELD_SEQUENCE` decimal(20,0) DEFAULT NULL COMMENT '查询字段排序号',
  `CONDITION_FIELD_SELECT_URL` varchar(255) DEFAULT NULL COMMENT '查询字段combobox对应的URL',
  `CONDITION_FIELD_SELECT_VF` varchar(80) DEFAULT NULL COMMENT '查询字段combobox对应的valueField',
  `CONDITION_FIELD_SELECT_TF` varchar(80) DEFAULT NULL COMMENT '查询字段combobox对应的textField',
  `CONDITION_FIELD_TEXTFIELD` varchar(80) DEFAULT NULL COMMENT '查询字段对应的textField',
  `AUTOCOMPLETE_FIELD` varchar(1) DEFAULT 'Y' COMMENT 'autocomplete显示列',
  `GRID_FIELD` varchar(1) DEFAULT 'Y' COMMENT '是否显示表格列',
  `GRID_FIELD_NAME` varchar(80) DEFAULT NULL COMMENT '表格列字段名',
  `GRID_FIELD_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '表格列排序号',
  `GRID_FIELD_WIDTH` decimal(20,0) DEFAULT NULL COMMENT '表格列宽',
  `GRID_FIELD_ALIGN` varchar(10) DEFAULT 'center' COMMENT '表格列布局',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `CONDITION_FIELD_LABEL_WIDTH` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`LOV_ITEM_ID`),
  KEY `SYS_LOV_ITEM_N1` (`LOV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10033 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_lov_item
-- ----------------------------
INSERT INTO `sys_lov_item` VALUES ('10001', '10001', 'userName', 'Y', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'userName', '10', '100', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10002', '10002', 'attachcategory.categoryname', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'categoryName', '10', '100', 'left', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10003', '10002', 'attachcategory.sourcetype', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'sourceType', '20', '80', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10004', '10002', 'attachcategory.categorypath', 'N', 'N', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'categoryPath', '30', '200', 'left', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10005', '10003', 'function.functionCode', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'functionCode', '1', '100', 'left', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10006', '10003', 'function.functionName', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'functionName', '1', '120', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10007', '10004', 'role.roleCode', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'roleCode', '1', '80', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10008', '10004', 'role.roleName', 'N', 'Y', null, null, null, 'N', null, null, '2', null, null, null, null, 'Y', 'Y', 'roleName', '2', '120', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10009', '10004', 'role.roleDescription', 'N', 'N', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'roleDescription', '3', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10010', '10005', 'resource.name', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'name', '1', '160', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10011', '10005', 'resource.url', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'url', '2', '220', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10012', '10006', 'position.name', 'N', 'Y', null, null, null, 'N', null, null, '2', null, null, null, null, 'Y', 'Y', 'name', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10013', '10006', 'position.description', 'N', 'Y', null, null, null, 'N', null, null, '3', null, null, null, null, 'Y', 'Y', 'description', '3', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10014', '10007', 'hrorgunit.name', 'N', 'Y', null, null, null, 'N', null, null, '2', null, null, null, null, 'Y', 'Y', 'name', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10015', '10007', 'hrorgunit.description', 'N', 'Y', null, null, null, 'N', null, null, '3', null, null, null, null, 'Y', 'Y', 'description', '3', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10016', '10008', 'position.name', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'name', '1', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10017', '10008', 'position.positionCode', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'positionCode', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10018', '10009', 'company.companycode', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'companyCode', '1', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10019', '10009', 'company.companyfullname', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'companyFullName', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10020', '10007', 'hrorgunit.unitcode', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'unitCode', '1', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10021', '10010', 'messagetemplate.templatecode', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'templateCode', '1', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10022', '10011', 'messageemailconfig.accountcode', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'accountCode', '1', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10023', '10011', 'messageaccount.name', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'userName', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10024', '10010', 'messagetemplate.name', 'N', 'Y', '200', null, null, 'N', null, null, '2', null, null, null, null, 'Y', 'Y', 'description', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10025', '10012', 'position.name', 'N', 'Y', null, null, null, 'N', null, null, '2', null, null, null, null, 'Y', 'Y', 'name', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10026', '10012', 'position.description', 'N', 'Y', null, null, null, 'N', null, null, '3', null, null, null, null, 'Y', 'Y', 'description', '3', '200', 'center', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10027', '10013', '公司Id', 'N', 'Y', '200', '', '', 'N', '', '', '1', '', '', '', '', 'Y', 'Y', 'companyId', '0', '200', 'center', '1', '-1', '-1', '10001', '2017-04-02 14:22:25', '10001', '2017-04-02 14:22:25', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10028', '10013', '公司名称', 'N', 'Y', '200', '', '', 'N', '', '', '1', '', '', '', '', 'Y', 'Y', 'companyName', '0', '200', 'center', '7', '-1', '-1', '10001', '2017-04-02 14:22:49', '10001', '2017-04-02 14:28:36', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10029', '10014', '物料Id', 'N', 'Y', '200', '', '', 'N', '', '', '1', '', '', '', '', 'Y', 'Y', 'inventoryItemId', '0', '200', 'center', '2', '-1', '-1', '10001', '2017-04-02 14:37:41', '10001', '2017-04-02 14:40:54', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10030', '10014', '物料描述', 'N', 'Y', '200', '', '', 'N', '', '', '1', '', '', '', '', 'Y', 'Y', 'itemDescription', '0', '200', 'center', '4', '-1', '-1', '10001', '2017-04-02 14:38:08', '10001', '2017-04-02 14:40:03', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10031', '10015', '客户Id', 'N', 'Y', '200', '', '', 'N', '', '', '1', '', '', '', '', 'Y', 'Y', 'customerId', '0', '200', 'center', '4', '-1', '-1', '10001', '2017-04-02 14:53:28', '10001', '2017-04-02 14:55:10', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10032', '10015', '客户名称', 'N', 'Y', '200', '', '', 'N', '', '', '1', '', '', '', '', 'Y', 'Y', 'customerName', '0', '200', 'center', '4', '-1', '-1', '10001', '2017-04-02 14:53:28', '10001', '2017-04-02 14:55:10', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `MESSAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_TYPE` varchar(10) DEFAULT NULL COMMENT '信息类型,email/sms',
  `MESSAGE_HOST` varchar(255) DEFAULT NULL COMMENT '消息服务器',
  `MESSAGE_FROM` varchar(255) DEFAULT NULL COMMENT '消息发出人',
  `SUBJECT` varchar(255) DEFAULT NULL COMMENT ' 标题',
  `CONTENT` longtext COMMENT '内容',
  `PRIORITY_LEVEL` varchar(25) DEFAULT NULL COMMENT '优先级',
  `SEND_FLAG` varchar(1) DEFAULT 'N' COMMENT '发送标记',
  `MESSAGE_SOURCE` varchar(255) DEFAULT NULL COMMENT '消息来源',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`),
  KEY `SYS_MESSAGE_N1` (`MESSAGE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_account`;
CREATE TABLE `sys_message_account` (
  `ACCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_TYPE` varchar(50) DEFAULT NULL COMMENT '账号类型',
  `ACCOUNT_CODE` varchar(50) DEFAULT NULL COMMENT '编号',
  `USER_NAME` varchar(240) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(240) DEFAULT NULL COMMENT ' 密码',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_account
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_attachment`;
CREATE TABLE `sys_message_attachment` (
  `ATTACHMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `FILE_ID` bigint(20) DEFAULT NULL COMMENT '附件id',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENT_ID`),
  KEY `SYS_MESSAGE_ATTACHMENT_N1` (`FILE_ID`),
  KEY `SYS_MESSAGE_ATTACHMENT_N2` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_email_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_email_account`;
CREATE TABLE `sys_message_email_account` (
  `ACCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_CODE` varchar(50) NOT NULL,
  `CONFIG_ID` bigint(20) DEFAULT NULL,
  `USER_NAME` varchar(240) DEFAULT NULL,
  `PASSWORD` varchar(240) DEFAULT NULL,
  `DESCRIPTION` varchar(240) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`),
  UNIQUE KEY `SYS_MESSAGE_EMAIL_ACCOUNT_U1` (`ACCOUNT_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_email_account
-- ----------------------------
INSERT INTO `sys_message_email_account` VALUES ('1', 'TEST', '5', 'hap_dev@126.com', null, null, '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message_email_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_email_config`;
CREATE TABLE `sys_message_email_config` (
  `CONFIG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONFIG_CODE` varchar(50) NOT NULL COMMENT '编号',
  `HOST` varchar(50) DEFAULT NULL COMMENT '服务器',
  `PORT` varchar(10) DEFAULT NULL COMMENT '端口',
  `TRY_TIMES` decimal(20,0) DEFAULT '3' COMMENT '重试次数',
  `DESCRIPTION` varchar(20) DEFAULT NULL COMMENT '描述',
  `USE_WHITE_LIST` varchar(1) DEFAULT 'N' COMMENT '是否使用白名单',
  `USER_NAME` varchar(240) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(240) DEFAULT NULL COMMENT '密码',
  `ENABLE` varchar(1) DEFAULT 'N',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CONFIG_ID`),
  UNIQUE KEY `SYS_MESSAGE_EMAIL_CONFIG_U1` (`CONFIG_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_email_config
-- ----------------------------
INSERT INTO `sys_message_email_config` VALUES ('5', 'TEST126', 'smtp.126.com', '25', '1', 'hap_dev on 126', 'N', 'hap_dev', 'hapdev11', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message_email_white_lt
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_email_white_lt`;
CREATE TABLE `sys_message_email_white_lt` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(240) DEFAULT NULL COMMENT '白名单地址',
  `CONFIG_ID` bigint(20) DEFAULT NULL COMMENT '邮箱配置id',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_email_white_lt
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_receiver
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_receiver`;
CREATE TABLE `sys_message_receiver` (
  `RECEIVER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `MESSAGE_TYPE` varchar(25) DEFAULT NULL COMMENT '消息类型,抄送/普通',
  `MESSAGE_ADDRESS` varchar(255) DEFAULT NULL COMMENT '消息地址,邮箱/手机号',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RECEIVER_ID`),
  KEY `SYS_MESSAGE_RECEIVER_N1` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_receiver
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_template`;
CREATE TABLE `sys_message_template` (
  `TEMPLATE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUBJECT` longtext COMMENT '模板标题',
  `CONTENT` longtext COMMENT '模板内容',
  `ACCOUNT_ID` bigint(20) DEFAULT NULL COMMENT '账号id',
  `TEMPLATE_CODE` varchar(50) NOT NULL COMMENT '模板编号',
  `TEMPLATE_TYPE` varchar(50) DEFAULT NULL COMMENT '模板类型,邮件/SMS',
  `PRIORITY_LEVEL` varchar(50) DEFAULT NULL COMMENT '优先级',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`TEMPLATE_ID`),
  UNIQUE KEY `SYS_MESSAGE_TEMPLATE_U1` (`TEMPLATE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_template
-- ----------------------------
INSERT INTO `sys_message_template` VALUES ('1', 'THis is a test email', 'test mail send by hap', null, 'TEST', null, 'NORMAL', 'Test Template', '1', '-1', '-1', '-1', '2017-03-27 15:25:23', '-1', '2017-03-27 15:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_message_template` VALUES ('10001', '工作流待办通知', '${receiver} 您好:</br> ${content} </br> 当前结点：${dom}', null, 'ACT_EMAIL_NOTIFIER', null, 'NORMAL', '工作流代办提醒', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message_transaction
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_transaction`;
CREATE TABLE `sys_message_transaction` (
  `TRANSACTION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `TRANSACTION_STATUS` varchar(25) DEFAULT NULL COMMENT '发送状态',
  `TRANSACTION_MESSAGE` longtext COMMENT '返回信息',
  `MESSAGE_ADDRESS` varchar(255) DEFAULT NULL COMMENT '消息地址,邮箱/手机号/会员/用户',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `SYS_MESSAGE_TRANSACTION_N1` (`MESSAGE_ID`),
  KEY `SYS_MESSAGE_TRANSACTION_N2` (`TRANSACTION_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for sys_preferences
-- ----------------------------
DROP TABLE IF EXISTS `sys_preferences`;
CREATE TABLE `sys_preferences` (
  `PREFERENCES_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PREFERENCES` varchar(30) DEFAULT NULL COMMENT '首选项名',
  `PREFERENCES_VALUE` varchar(80) DEFAULT NULL COMMENT '首选项值',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '账号ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PREFERENCES_ID`),
  UNIQUE KEY `SYS_PREFERENCES_U1` (`PREFERENCES`,`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_preferences
-- ----------------------------
INSERT INTO `sys_preferences` VALUES ('1', 'locale', 'zh_CN', '10001', '8', '-1', '-1', '10001', '2017-03-30 11:40:51', '10001', '2017-04-04 21:16:08', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_profile
-- ----------------------------
DROP TABLE IF EXISTS `sys_profile`;
CREATE TABLE `sys_profile` (
  `PROFILE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROFILE_NAME` varchar(40) NOT NULL COMMENT '配置文件名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROFILE_ID`),
  UNIQUE KEY `SYS_PROFILE_U1` (`PROFILE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_profile
-- ----------------------------

-- ----------------------------
-- Table structure for sys_profile_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_profile_value`;
CREATE TABLE `sys_profile_value` (
  `PROFILE_VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROFILE_ID` varchar(32) DEFAULT NULL COMMENT '配置文件ID',
  `LEVEL_ID` varchar(32) DEFAULT NULL COMMENT '层次ID',
  `LEVEL_VALUE` varchar(40) DEFAULT NULL COMMENT '层次值',
  `PROFILE_VALUE` varchar(80) DEFAULT NULL COMMENT '配置文件值',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROFILE_VALUE_ID`),
  UNIQUE KEY `SYS_PROFILE_VALUE_U1` (`PROFILE_ID`,`LEVEL_ID`,`LEVEL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_profile_value
-- ----------------------------

-- ----------------------------
-- Table structure for sys_prompts
-- ----------------------------
DROP TABLE IF EXISTS `sys_prompts`;
CREATE TABLE `sys_prompts` (
  `PROMPT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROMPT_CODE` varchar(255) DEFAULT NULL COMMENT '文本编码',
  `LANG` varchar(10) DEFAULT NULL COMMENT '语言',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROMPT_ID`),
  UNIQUE KEY `SYS_PROMPTS_U1` (`PROMPT_CODE`,`LANG`)
) ENGINE=InnoDB AUTO_INCREMENT=10777 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_prompts
-- ----------------------------
INSERT INTO `sys_prompts` VALUES ('10001', 'hap.main_menu', 'zh_CN', '主菜单', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10002', 'hap.main_menu', 'en_GB', 'Main Menu', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10003', 'hap.home', 'zh_CN', '首页', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10004', 'hap.hone', 'en_GB', 'Home', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10005', 'hap.query', 'zh_CN', '查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10006', 'hap.query', 'en_GB', 'Query', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10007', 'hap.cancel', 'zh_CN', '取消', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10008', 'hap.cancel', 'en_GB', 'Cancel', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10009', 'hap.new', 'zh_CN', '新建', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10010', 'hap.new', 'en_GB', 'New', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10011', 'hap.delete', 'zh_CN', '删除', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10012', 'hap.delete', 'en_GB', 'Delete', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10013', 'hap.save', 'zh_CN', '保存', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10014', 'hap.save', 'en_GB', 'Save', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10015', 'hap.reset', 'zh_CN', '重置', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10016', 'hap.reset', 'en_GB', 'Reset', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10017', 'hap.edit', 'zh_CN', '编辑', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10018', 'hap.edit', 'en_GB', 'Edit', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10019', 'hap.prompt', 'zh_CN', '提示', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10020', 'hap.prompt', 'en_GB', 'Prompt', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10021', 'hap.error', 'zh_CN', '错误', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10022', 'hap.error', 'en_GB', 'Error', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10023', 'hap.warning', 'zh_CN', '警告', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10024', 'hap.warning', 'en_GB', 'Warning', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10025', 'hap.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10026', 'hap.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10027', 'hap.validation.notempty', 'zh_CN', '{0}不能为空！', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10028', 'hap.validation.notempty', 'en_GB', '{0} can not be empty!', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10029', 'hap.validation.notnull', 'zh_CN', '{0}不能为空！', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10030', 'hap.validation.notnull', 'en_GB', '{0} can not be null!', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10031', 'hap.validation.email', 'zh_CN', '{0}不是有效的邮件地址。', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10032', 'hap.validation.email', 'en_GB', '{0} is not a email address.', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10033', 'hap.submit', 'zh_CN', '提交', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10034', 'hap.submit', 'en_GB', 'submit', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10035', 'hap.logout', 'zh_CN', '退出', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10036', 'hap.logout', 'en_GB', 'Logout', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10037', 'hap.preferences', 'zh_CN', '首选项', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10038', 'hap.preferences', 'en_GB', 'Preference', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10039', 'hap.ok', 'zh_CN', '确定', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10040', 'hap.ok', 'en_GB', 'OK', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10041', 'lov.placeholder', 'zh_CN', '提示', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10042', 'lov.placeholder', 'en_GB', 'tips', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10043', 'lov.dropdown', 'zh_CN', '自动完成', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10044', 'lov.dropdown', 'en_GB', 'autocomplete', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10045', 'lov.code', 'zh_CN', '代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10046', 'lov.code', 'en_GB', 'Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10047', 'lov.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10048', 'lov.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10049', 'lov.height', 'zh_CN', '高度', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10050', 'lov.height', 'en_GB', 'Height', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10051', 'lov.lovid', 'zh_CN', 'Lov Id', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10052', 'lov.lovid', 'en_GB', 'Lov Id', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10053', 'lov.lovitems', 'zh_CN', 'Lov Items', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10054', 'lov.lovitems', 'en_GB', 'Lov Items', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10055', 'lov.customsql', 'zh_CN', '自定义sql', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10056', 'lov.customsql', 'en_GB', 'Custom sql', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10057', 'lov.sqltype', 'zh_CN', 'Sql类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10058', 'ov.sqltype', 'en_GB', 'Sql Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10059', 'lov.sqlid', 'zh_CN', 'Sql Id', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10060', 'lov.sqlid', 'en_GB', 'Sql Id', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10061', 'lov.textfield', 'zh_CN', 'TextField', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10062', 'lov.textfield', 'en_GB', 'TextField', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10063', 'lov.title', 'zh_CN', '标题', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10064', 'lov.title', 'en_GB', 'Title', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10065', 'lov.valuefield', 'zh_CN', 'ValueField', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10066', 'lov.valuefield', 'en_GB', 'ValueField', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10067', 'lov.width', 'en_GB', 'Width', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10068', 'lov.width', 'zh_CN', '宽度', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10069', 'lov.querycolumns', 'zh_CN', '列数', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10070', 'lov.columns', 'en_GB', 'Columns', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10071', 'lovitem.display', 'zh_CN', '显示', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10072', 'lovitem.display', 'en_GB', 'Display', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10073', 'lovitem.name', 'zh_CN', '字段名', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10074', 'lovitem.name', 'en_GB', 'Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10075', 'lovitem.gridfieldwidth', 'zh_CN', '列宽度', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10076', 'lovitem.gridfieldwidth', 'en_GB', 'ColumnWidth', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10077', 'lovitem.conditionfield', 'zh_CN', '查询字段', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10078', 'lovitem.conditionfield', 'en_GB', 'Conditions', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10079', 'lovitem.newline', 'zh_CN', '新行', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10080', 'lovitem.newline', 'en_GB', 'Newline', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10081', 'lovitem.type', 'zh_CN', '查询配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10082', 'lovitem.type', 'en_GB', 'Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10083', 'lovitem.opts', 'zh_CN', '参数', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10084', 'lovitem.opts', 'en_GB', 'Opts', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10085', 'lovitem.dropdown', 'zh_CN', 'Dropdown', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10086', 'lovitem.dropdown', 'en_GB', 'Dropdown', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10087', 'lovitem.gridcolumn', 'zh_CN', '表格列', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10088', 'lovitem.gridcolumn', 'en_GB', 'GridColumn', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10089', 'lov.delayload', 'zh_CN', '延迟加载', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10090', 'lov.delayload', 'en_GB', 'DelayLoad', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10091', 'lov.needqueryparam', 'zh_CN', '查询条件必输', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10092', 'lov.needqueryparam', 'en_GB', 'NeedQueryParam', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10093', 'lovitem.conditionfieldwidth', 'zh_CN', '查询字段宽度', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10094', 'lovitem.conditionfieldwidth', 'en_GB', 'Width', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10095', 'lovitem.conditionfieldsequence', 'zh_CN', '查询字段序号', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10096', 'lovitem.conditionfieldsequence', 'en_GB', 'Sequence', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10097', 'lovitem.conditionfieldname', 'zh_CN', '查询字段名', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10098', 'lovitem.conditionfieldname', 'en_GB', 'Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10099', 'lovitem.conditionfieldselectcode', 'zh_CN', '快速编码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10100', 'lovitem.conditionfieldselectcode', 'en_GB', 'Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10101', 'lovitem.conditionfieldlovcode', 'zh_CN', '通用lov编码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10102', 'lovitem.conditionfieldlovcode', 'en_GB', 'LovCode', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10103', 'lovitem.gridfieldsequence', 'zh_CN', '列序号', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10104', 'lovitem.gridfieldsequence', 'en_GB', 'Sequence', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10105', 'lovitem.gridcolumnalign', 'zh_CN', '列对齐方式', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10106', 'lovitem.gridcolumnalign', 'en_GB', 'Column Align', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10107', 'lov.autocompletefield', 'zh_CN', '自动完成显示列', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10108', 'lov.autocompletefield', 'en_GB', 'AutoCompleteColumn', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10109', 'lov.canpopup', 'zh_CN', '弹出选择框', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10110', 'lov.canpopup', 'en_GB', 'popup', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10111', 'lov.editable', 'zh_CN', '可编辑', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10112', 'lov.editable', 'en_GB', 'editable', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10113', 'lovitem.field_type', 'zh_CN', '字段类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10114', 'lovitem.field_type', 'en_GB', 'field type', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10115', 'lovitem.ds_type', 'zh_CN', '数据来源', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10116', 'lovitem.ds_type', 'en_GB', '数据来源', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10117', 'lovitem.ds_type.url', 'zh_CN', 'URL', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10118', 'lovitem.ds_type.url', 'en_GB', 'URL', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10119', 'lovitem.ds_type.code', 'zh_CN', '快速编码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10120', 'lovitem.ds_type.code', 'en_GB', 'Sys Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10121', 'user.username', 'zh_CN', '用户名', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10122', 'user.username', 'en_GB', 'User Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10123', 'user.password', 'zh_CN', '密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10124', 'user.password', 'en_GB', 'Password', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10125', 'user.email', 'zh_CN', '邮件', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10126', 'user.email', 'en_GB', 'Email', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10127', 'user.phone', 'zh_CN', '电话', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10128', 'user.phone', 'en_GB', 'Phone', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10129', 'role.rolecode', 'zh_CN', '角色代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10130', 'role.rolecode', 'en_GB', 'Role Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10131', 'role.rolename', 'zh_CN', '角色名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10132', 'role.rolename', 'en_GB', 'Role Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10133', 'role.roledescription', 'zh_CN', '角色描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10134', 'role.roledescription', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10135', 'user.allocationrole', 'zh_CN', '角色分配', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10136', 'user.allocationrole', 'en_GB', 'Role Allocate', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10137', 'code.code', 'zh_CN', '代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10138', 'code.code', 'en_GB', 'Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10139', 'code.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10140', 'code.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10141', 'hap.action', 'zh_CN', '操作', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10142', 'hap.action', 'en_GB', 'Operation', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10143', 'codevalue.value', 'zh_CN', '值', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10144', 'codevalue.value', 'en_GB', 'Value', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10145', 'codevalue.meaning', 'zh_CN', '含义', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10146', 'codevalue.meaning', 'en_GB', 'Meaning', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10147', 'codevalue.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10148', 'codevalue.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10149', 'profile.profilename', 'zh_CN', '名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10150', 'profile.profilename', 'en_GB', 'Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10151', 'profile.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10152', 'profile.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10153', 'language.langcode', 'zh_CN', '语言代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10154', 'language.langcode', 'en_GB', 'Lang Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10155', 'language.baselang', 'zh_CN', '基准语言', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10156', 'language.baselang', 'en_GB', 'Base Lang', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10157', 'language.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10158', 'language.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10159', 'jobdetaildto.jobname', 'zh_CN', '任务名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10160', 'jobdetaildto.jobname', 'en_GB', 'Job Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10161', 'jobdetaildto.jobgroup', 'zh_CN', '任务组', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10162', 'jobdetaildto.jobgroup', 'en_GB', 'Job Group', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10163', 'jobdetaildto.jobclassname', 'zh_CN', '任务类名', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10164', 'jobdetaildto.jobclassname', 'en_GB', 'Job Class', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10165', 'jobdetaildto.description', 'zh_CN', '任务描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10166', 'jobdetaildto.description', 'en_GB', 'Job Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10167', 'jobrunninginfodto.previousfiretime', 'zh_CN', '上次执行时间', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10168', 'jobrunninginfodto.previousfiretime', 'en_GB', 'Pre Fire Time', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10169', 'jobrunninginfodto.scheduledfiretime', 'zh_CN', '计划执行时间', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10170', 'jobrunninginfodto.scheduledfiretime', 'en_GB', 'Sched Fire Time', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10171', 'jobrunninginfodto.nextfiretime', 'zh_CN', '下次执行时间', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10172', 'jobrunninginfodto.nextfiretime', 'en_GB', 'Next Fire Time', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10173', 'jobrunninginfodto.firetime', 'zh_CN', '实际执行时间', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10174', 'jobrunninginfodto.firetime', 'en_GB', 'Accurate Fire Time', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10175', 'jobrunninginfodto.jobstatus', 'zh_CN', '任务状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10176', 'jobrunninginfodto.jobstatus', 'en_GB', 'Job Status', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10177', 'jobrunninginfodto.executionsummary', 'zh_CN', '执行概要', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10178', 'jobrunninginfodto.executionsummary', 'en_GB', 'Execution Summary', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10179', 'hap.pause', 'zh_CN', '暂停', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10180', 'hap.pause', 'en_GB', 'Pause', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10181', 'hap.resume', 'zh_CN', '恢复', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10182', 'hap.resume', 'en_GB', 'Resume', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10183', 'job.newcronjob', 'zh_CN', '新建 CRON 任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10184', 'job.newcronjob', 'en_GB', 'New Cron Job', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10185', 'job.newsimplejob', 'zh_CN', '新建简单任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10186', 'job.newsimplejob', 'en_GB', 'New Simple Job', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10187', 'prompt.promptcode', 'zh_CN', '代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10188', 'prompt.promptcode', 'en_GB', 'Prompt Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10189', 'prompt.sourcelang', 'zh_CN', '语言', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10190', 'prompt.sourcelang', 'en_GB', 'Language', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10191', 'prompt.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10192', 'prompt.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10193', 'function.modulecode', 'zh_CN', '模块代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10194', 'function.modulecode', 'en_GB', 'Module Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10195', 'function.functioncode', 'zh_CN', '功能代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10196', 'funciton.functioncode', 'en_GB', 'Function Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10197', 'function.functionname', 'zh_CN', '功能名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10198', 'function.functionname', 'en_GB', 'Function Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10199', 'function.parentfunctionid', 'zh_CN', '父级功能', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10200', 'function.parentfunctionid', 'en_GB', 'Parent Function', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10201', 'function.functionicon', 'zh_CN', '功能图标', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10202', 'function.functionicon', 'en_GB', 'Function Icon', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10203', 'function.functionsequence', 'zh_CN', '功能序号', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10204', 'function.functionsequence', 'en_GB', 'Function Seq', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10205', 'function.functiondescription', 'zh_CN', '功能描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10206', 'function.functiondescription', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10207', 'function.mainpage', 'zh_CN', '入口页面', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10208', 'function.mainpage', 'en_GB', 'Entry Page', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10209', 'function.functionresource', 'zh_CN', '功能资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10210', 'function.functionresource', 'en_GB', 'Resources', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10211', 'function.resourceallocation', 'zh_CN', '分配资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10212', 'function.resourceallocation', 'en_GB', 'Resource Allocation', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10213', 'resource.url', 'zh_CN', 'URL', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10214', 'resource.url', 'en_GB', 'URL', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10215', 'resource.type', 'zh_CN', '类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10216', 'resource.type', 'en_GB', 'Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10217', 'resource.name', 'zh_CN', '名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10218', 'resource.name', 'en_GB', 'Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10219', 'resource.loginrequire', 'zh_CN', '需要登录', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10220', 'resource.loginrequire', 'en_GB', 'Login Require', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10221', 'resource.accesscheck', 'zh_CN', '权限控制', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10222', 'resource.accesscheck', 'en_GB', 'Access Check', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10223', 'resource.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10224', 'resource.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10225', 'resource.resourceitem', 'zh_CN', '资源组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10226', 'resource.resourceitem', 'en_GB', 'Resource Item', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10227', 'resource.itemallocation', 'zh_CN', '组件定义', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10228', 'resource.itemallocation', 'en_GB', 'Items', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10229', 'resourceitem.itemid', 'zh_CN', '组件标识', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10230', 'resourceitem.itemid', 'en_GB', 'Item ID', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10231', 'resourceitem.itemname', 'zh_CN', '组件名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10232', 'resourceitem.itemname', 'en_GB', 'Item Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10233', 'resourceitem.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10234', 'resourceitem.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10235', 'resourceitem.resource', 'zh_CN', '目标资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10236', 'resourceitem.resource', 'en_GB', 'Target Resource', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10237', 'hap.expand', 'zh_CN', '展开', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10238', 'hap.expand', 'en_GB', 'Expand', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10239', 'hap.collapse', 'zh_CN', '合并', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10240', 'hap.collapse', 'en_GB', 'Collapse', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10241', 'hap.comment', 'zh_CN', '备注', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10242', 'hap.comment', 'en_GB', 'Comment', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10243', 'messageemailconfig.configcode', 'zh_CN', '配置代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10244', 'messageemailconfig.configcode', 'en_GB', 'Config Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10245', 'messageemailconfig.introduction', 'zh_CN', '简介', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10246', 'messageemailconfig.introduction', 'en_GB', 'Introduction', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10247', 'messageemailconfig.host', 'zh_CN', '发送服务器', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10248', 'messageemailconfig.host', 'en_GB', 'SMTP Host', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10249', 'messageemailconfig.port', 'zh_CN', '端口', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10250', 'messageemailconfig.port', 'en_GB', 'Port', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10251', 'messageemailconfig.trytimes', 'zh_CN', '重试次数', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10252', 'messageemailconfig.trytimes', 'en_GB', 'Try Times', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10253', 'messageemailconfig.usewhitelist', 'zh_CN', '启用白名单', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10254', 'messageemailconfig.usewhitelist', 'en_GB', 'Use White List', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10255', 'messageemailconfig.username', 'zh_CN', '用户名', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10256', 'messageemailconfig.username', 'en_GB', 'User Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10257', 'messageemailconfig.password', 'zh_CN', '密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10258', 'messageemailconfig.password', 'en_GB', 'Password', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10259', 'messageemailconfig.accountcode', 'zh_CN', '账户代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10260', 'messageemailconfig.accountcode', 'en_GB', 'Account Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10261', 'messageemailconfig.account', 'zh_CN', '账户', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10262', 'messageemailconfig.account', 'en_GB', 'Account', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10263', 'messageemailconfig.whitelist', 'zh_CN', '白名单', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10264', 'messageemailconfig.whitelist', 'en_GB', 'White List', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10265', 'messageemailconfig.address', 'zh_CN', '地址', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10266', 'messageemailconfig.address', 'en_GB', 'Address', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10267', 'messagetemplate.templatecode', 'zh_CN', '模板代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10268', 'messagetemplate.templatecode', 'en_GB', 'Template Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10269', 'messagetemplate.name', 'zh_CN', '模板名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10270', 'messagetemplate.name', 'en_GB', 'Template Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10271', 'messagetemplate.prioritylevel', 'zh_CN', '优先级', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10272', 'messagetemplate.prioritylevel', 'en_GB', 'Priority', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10273', 'messagetemplate.subject', 'zh_CN', '主题', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10274', 'messagetemplate.subject', 'en_GB', 'Subject', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10275', 'messagetemplate.content', 'zh_CN', '内容', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10276', 'messagetemplate.content', 'en_GB', 'Content', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10277', 'message.subject', 'zh_CN', '主题', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10278', 'message.subject', 'en_GB', 'Subject', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10279', 'message.content', 'zh_CN', '内容', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10280', 'message.content', 'en_GB', 'Content', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10281', 'message.receivers', 'zh_CN', '收件人', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10282', 'message.receivers', 'en_GB', 'Receivers', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10283', 'user.info', 'zh_CN', '用户信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10284', 'user.info', 'en_GB', 'User Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10285', 'user.status', 'zh_CN', '状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10286', 'user.status', 'en_GB', 'Status', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10287', 'user.updatepassword', 'zh_CN', '修改密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10288', 'user.updatepassword', 'en_GB', 'Update Password', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10289', 'user.current_password', 'zh_CN', '当前密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10290', 'user.current_password', 'en_GB', 'Current Password', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10291', 'user.new_password', 'zh_CN', '新密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10292', 'user.new_password', 'en_GB', 'New Password', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10293', 'user.again_new_password', 'zh_CN', '确认新密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10294', 'user.again_new_password', 'en_GB', 'New Password Again', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10295', 'preference.timezone', 'zh_CN', '时区', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10296', 'preference.timezone', 'en_GB', 'TimeZone', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10297', 'profilevalue.levelid', 'zh_CN', '层级', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10298', 'profilevalue.levelid', 'en_GB', 'Level', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10299', 'profilevalue.levelvalue', 'zh_CN', '层级值', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10300', 'profilevalue.levelvalue', 'en_GB', 'Level Value', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10301', 'profilevalue.profilevalue', 'zh_CN', '配置值', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10302', 'profilevalue.profilevalue', 'en_GB', 'Profile Value', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10303', 'attachcategory.categoryname', 'zh_CN', '目录名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10304', 'attachcategory.categoryname', 'en_GB', 'Category Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10305', 'attachcategory.categorypath', 'zh_CN', '存储路径', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10306', 'attachcategory.categorypath', 'en_GB', 'Save Path', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10307', 'attachcategory.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10308', 'attachcategory.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10309', 'attachcategory.allowedfiletype', 'zh_CN', '文件类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10310', 'attachcategory.allowedfiletype', 'en_GB', 'File Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10311', 'attachcategory.allowedfilesize', 'zh_CN', '最大文件长度', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10312', 'attachcategory.allowedfilesize', 'en_GB', 'Allow File Size', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10313', 'attachcategory.sourcetype', 'zh_CN', '来源类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10314', 'attachcategory.sourcetype', 'en_GB', 'Source Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10315', 'attachcategory.isunique', 'zh_CN', '唯一', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10316', 'attachcategory.isunique', 'en_GB', 'Unique', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10317', 'attachcategory.statusname', 'zh_CN', '状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10318', 'attachcategory.statusname', 'en_GB', 'Status', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10319', 'attachcategory.statusname.normal', 'zh_CN', '普通', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10320', 'attachcategory.statusname.normal', 'en_GB', 'Normal', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10321', 'attachcategory.statusname.archived', 'zh_CN', '压缩', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10322', 'attachcategory.statusname.archived', 'en_GB', 'Archived', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10323', 'attachcategory.archive', 'zh_CN', '压缩', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10324', 'attachcategory.archive', 'en_GB', 'Archive', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10325', 'sysfile.filename', 'zh_CN', '文件名', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10326', 'sysfile.filename', 'en_GB', 'File Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10327', 'sysfile.filesize', 'zh_CN', '文件大小', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10328', 'sysfile.filesize', 'en_GB', 'File Size', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10329', 'sysfile.uploaddate', 'zh_CN', '上传日期', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10330', 'sysfile.uploaddate', 'en_GB', 'Upload Date', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10331', 'sysfile.filetype', 'zh_CN', '文件类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10332', 'sysfile.filetype', 'en_GB', 'File Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10333', 'hap.view', 'zh_CN', '查看', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10334', 'hap.view', 'en_GB', 'View', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10335', 'sysfile.upload', 'zh_CN', '上传', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10336', 'sysfile.upload', 'en_GB', 'Upload', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10337', 'hap.tip.info', 'zh_CN', '提示', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10338', 'hap.tip.info', 'en_GB', 'Information', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10339', 'hap.tip.success', 'zh_CN', '成功', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10340', 'hap.tip.success', 'en_GB', 'Success', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10341', 'function.resourcechoose', 'zh_CN', '选择资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10342', 'function.resourcechoose', 'en_GB', 'Choose Resource', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10343', 'hap.tip.delete_confirm', 'zh_CN', '确定删除？', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10344', 'hap.tip.delete_confirm', 'en_GB', 'Confirm Delete?', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10345', 'hap.confirm', 'zh_CN', '确认', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10346', 'hap.confirm', 'en_GB', 'Confirm', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10347', 'role.changerole', 'zh_CN', '切换角色', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10348', 'role.changerole', 'en_GB', 'Change Role', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10349', 'user.verificode', 'zh_CN', '验证码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10350', 'user.verificode', 'en_GB', 'Verify Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10351', 'account.common.logintip', 'zh_CN', '请登录', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10352', 'account.common.logintip', 'en_GB', 'Please Login', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10353', 'hap.confirm_exit', 'zh_CN', '确定退出？', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10354', 'hap.confirm_exit', 'en_GB', 'Quit?', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10355', 'rolefunction.select_role', 'zh_CN', '选择角色', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10356', 'rolefunction.select_role', 'en_GB', 'Select Role', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10357', 'hap.login', 'zh_CN', '登录', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10358', 'hap.login', 'en_GB', 'Login', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10359', 'hap.multilanguage_editor', 'zh_CN', '多语言编辑', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10360', 'hap.multilanguage_editor', 'en_GB', 'MultiLangauge Edit', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10361', 'error.login.verification_code_error', 'zh_CN', '验证码错误', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10362', 'error.login.verification_code_error', 'en_GB', 'Verification Code Error', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10363', 'error.login.name_password_not_match', 'zh_CN', '用户名或密码错误', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10364', 'error.login.name_password_not_match', 'en_GB', 'Wrong user name or password', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10365', 'job.attributename', 'zh_CN', '参数名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10366', 'job.attributename', 'en_GB', 'Attribute Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10367', 'job.attributevalue', 'zh_CN', '参数值', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10368', 'job.attributevalue', 'en_GB', 'Attribute Value', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10369', 'crontriggerdto.cronexpression', 'zh_CN', 'Cron 表达式', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10370', 'crontriggerdto.cronexpression', 'en_GB', 'Cron Expression', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10371', 'triggerdto.starttime', 'zh_CN', '开始时间', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10372', 'triggerdto.starttime', 'en_GB', 'Start Time', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10373', 'triggerdto.endtime', 'zh_CN', '结束时间', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10374', 'triggerdto.endtime', 'en_GB', 'End Time', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10375', 'error.user.two_password_not_match', 'zh_CN', '两次密码不匹配', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10376', 'error.user.two_password_not_match', 'en_GB', 'Two Password Not Match', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10377', 'error.user.accout_locked', 'zh_CN', '账户已锁定', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10378', 'error.user.accout_locked', 'en_GB', 'Account Locked', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10379', 'error.user.account_not_active', 'zh_CN', '用户未激活', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10380', 'error.user.account_not_active', 'en_GB', 'User Not Active', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10381', 'error.user.account_expired', 'zh_CN', '用户已过期', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10382', 'error.user.account_expired', 'en_GB', 'User Expired', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10383', 'user.startactivedate', 'zh_CN', '开始有效日期', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10384', 'user.startactivedate', 'en_GB', 'Start Active Date', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10385', 'user.endactivedate', 'zh_CN', '失效日期', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10386', 'user.endactivedate', 'en_GB', 'End Active Date', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10387', 'error.record_not_exists_or_version_not_match', 'zh_CN', '记录不存在或版本不一致.', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10388', 'error.record_not_exists_or_version_not_match', 'en_GB', 'Record not exists or version NOT MATCH.', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10389', 'sys.config.configuration', 'en_GB', 'System Configuration', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10390', 'sys.config.configuration', 'zh_CN', '系统配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10391', 'sys.config.style', 'en_GB', 'Style', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10392', 'sys.config.style', 'zh_CN', '样式', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10393', 'sys.config.safety', 'en_GB', 'Safety Policy', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10394', 'sys.config.safety', 'zh_CN', '安全策略', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10395', 'sys.config.other', 'en_GB', 'PassWord Policy', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10396', 'sys.config.other', 'zh_CN', '密码策略', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10397', 'sys.config.system_title', 'en_GB', 'system title', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10398', 'sys.config.system_title', 'zh_CN', '系统标题', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10399', 'sys.config.systemlogo', 'en_GB', 'system logo', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10400', 'sys.config.systemlogo', 'zh_CN', '系统图标', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10401', 'sys.config.favicon', 'en_GB', 'favicon', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10402', 'sys.config.favicon', 'zh_CN', 'favicon', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10403', 'sys.config.captcha', 'en_GB', 'captcha', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10404', 'sys.config.captcha', 'zh_CN', '验证码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10405', 'sys.config.default_password', 'en_GB', 'new user default password', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10406', 'sys.config.default_password', 'zh_CN', '新用户默认密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10407', 'sys.config.systemlogo.desciption', 'en_GB', 'Please upload so. jpg, jpeg, png, gifsuffix, such as pictures, a ratio of 70 * 30', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10408', 'sys.config.systemlogo.desciption', 'zh_CN', '只能上传.png,.jpg,.jpeg,.gif等后缀的图片,比例为70*30', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10409', 'sys.config.favicon.desciption', 'en_GB', 'Please upload so. jpg, jpeg, png, gifsuffix, such as pictures, a ratio of 32*32', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10410', 'sys.config.favicon.desciption', 'zh_CN', '只能上传.png,.jpg,.jpeg,.gif等后缀的图片,比例为32*32', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10411', 'hap.enableflag', 'zh_CN', '是否启用', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10412', 'hap.enableflag', 'en_GB', 'Enabled', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10413', 'role.isexpired', 'zh_CN', '是否过期', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10414', 'role.isexpired', 'en_GB', 'Expired', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10415', 'employee.employeelevelcode', 'en_GB', 'Level Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10416', 'employee.employeelevelcode', 'zh_CN', '员工等级代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10417', 'preference.locale', 'en_GB', 'Select Language', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10418', 'preference.locale', 'zh_CN', '选择语言', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10419', 'preference.timezone.description', 'en_GB', 'Select your time zone', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10420', 'preference.timezone.description', 'zh_CN', '请选择您所在的区域的时区', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10421', 'preference.locale.description', 'en_GB', 'Select your language', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10422', 'preference.locale.description', 'zh_CN', '请选择语言种类', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10423', 'preference.theme', 'en_GB', 'Select Theme', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10424', 'preference.theme', 'zh_CN', '选择皮肤', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10425', 'position.name', 'en_GB', 'Position Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10426', 'position.name', 'zh_CN', '岗位名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10427', 'position.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10428', 'position.description', 'zh_CN', '岗位描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10429', 'position.positioncode', 'en_GB', 'PositionCode', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10430', 'position.positioncode', 'zh_CN', '岗位编码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10431', 'position.parentpositionname', 'en_GB', 'Parent Position', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10432', 'position.parentpositionname', 'zh_CN', '上级岗位', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10433', 'hrorgunit.name', 'en_GB', 'Unit Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10434', 'hrorgunit.name', 'zh_CN', '组织名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10435', 'hrorgunit.description', 'en_GB', 'Unit Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10436', 'hrorgunit.description', 'zh_CN', '组织描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10437', 'hrorgunit.unitcode', 'en_GB', 'Unit Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10438', 'hrorgunit.unitcode', 'zh_CN', '组织编码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10439', 'hrorgunit.parentname', 'en_GB', 'Superior Unit', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10440', 'hrorgunit.parentname', 'zh_CN', '上级组织', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10441', 'hap.tip.noselect', 'en_GB', 'You did not select any item!', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10442', 'hap.tip.noselect', 'zh_CN', '您未选中任何项！', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10443', 'employee.employeecode', 'en_GB', 'Employee Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10444', 'employee.employeecode', 'zh_CN', '员工编码', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10445', 'employee.name', 'en_GB', 'Employee Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10446', 'employee.name', 'zh_CN', '员工姓名', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10447', 'employee.positionallocation', 'en_GB', 'Position Allocation', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10448', 'employee.positionallocation', 'zh_CN', '岗位分配', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10449', 'employee.borndate', 'en_GB', 'Born Date', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10450', 'employee.borndate', 'zh_CN', '出生日期', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10451', 'employee.mobile', 'en_GB', 'Phone Number', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10452', 'employee.mobile', 'zh_CN', '移动电话', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10453', 'employee.joindate', 'en_GB', 'Join Date', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10454', 'employee.joindate', 'zh_CN', '入职日期', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10455', 'employee.gender', 'en_GB', 'Gender', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10456', 'employee.gender', 'zh_CN', '性别', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10457', 'employee.status', 'en_GB', 'Status', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10458', 'employee.status', 'zh_CN', '状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10459', 'employee.enabledflag', 'en_GB', 'Enabled Flag', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10460', 'employee.enabledflag', 'zh_CN', '启用状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10461', 'employee.certificateid', 'en_GB', 'ID', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10462', 'employee.certificateid', 'zh_CN', '证件号', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10463', 'employee.companyinfo', 'en_GB', 'Company Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10464', 'employee.companyinfo', 'zh_CN', '公司信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10465', 'employee.otherinfo', 'en_GB', 'Other Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10466', 'employee.otherinfo', 'zh_CN', '其他信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10467', 'employee.personalinfo', 'en_GB', 'Personal Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10468', 'employee.personalinfo', 'zh_CN', '个人信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10469', 'employee.ismainposition', 'en_GB', 'Main Position', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10470', 'employee.ismainposition', 'zh_CN', '是否主岗位', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10471', 'position.selectposition', 'en_GB', 'Select Position', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10472', 'position.selectposition', 'zh_CN', '选择岗位', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10473', 'hrorgunit.unittreelist', 'zh_CN', '查看组织结构', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10474', 'hrorgunit.unittreelist', 'en_GB', 'Unit Structure', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10475', 'hrorgunit.unitinfo', 'zh_CN', '组织信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10476', 'hrorgunit.unitinfo', 'en_GB', 'Unit Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10477', 'sys.config.password_policy', 'en_GB', 'PassWord Policy', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10478', 'sys.config.password_policy', 'zh_CN', '密码策略', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10479', 'sys.config.password_min_length', 'en_GB', 'Password Min Length', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10480', 'sys.config.password_min_length', 'zh_CN', '密码最小长度', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10481', 'sys.config.password_complexity', 'en_GB', 'Password Complexity', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10482', 'sys.config.password_complexity', 'zh_CN', '密码复杂度要求', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10483', 'error.user.update_password', 'zh_CN', '用户密码失效，重新设置密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10484', 'error.user.update_password', 'en_GB', 'password expire ,reset your password', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10485', 'error.user.current_password_notempty', 'zh_CN', '当前密码不能为空', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10486', 'error.user.current_password_notempty', 'en_GB', 'current password can not be empty', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10487', 'error.user.new_password_notempty', 'zh_CN', '新密码不能为空', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10488', 'error.user.new_password_notempty', 'en_GB', 'new password can not be empty', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10489', 'error.user.new_password_again', 'zh_CN', '请再次输入新密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10490', 'error.user.new_password_again', 'en_GB', 'please input new password again', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10491', 'sys.config.password_invalid_time', 'zh_CN', '密码失效时间', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10492', 'sys.config.password_invalid_time', 'en_GB', 'password invalid time', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10493', 'user.passwordlength.insufficient', 'zh_CN', '密码长度不能小于', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10494', 'user.passwordlength.insufficient', 'en_GB', 'Password length cannot be less than', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10495', 'user.password.discord', 'zh_CN', '密码输入不一致', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10496', 'user.password.discord', 'en_GB', 'Do not match the password input', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10497', 'company.companycode', 'zh_CN', '公司代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10498', 'company.companycode', 'en_GB', 'company code', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10499', 'company.companyshortname', 'zh_CN', '公司简称', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10500', 'company.companyshortname', 'en_GB', 'company short name', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10501', 'company.companyfullname', 'en_GB', 'company full name', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10502', 'company.companyfullname', 'zh_CN', '公司全称', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10503', 'company.companytype', 'zh_CN', '公司类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10504', 'company.companytype', 'en_GB', 'company type', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10505', 'company.address', 'zh_CN', '公司地址', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10506', 'company.address', 'en_GB', 'company address', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10507', 'company.companylevelid', 'zh_CN', '公司等级', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10508', 'company.companylevelid', 'en_GB', 'company level id', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10509', 'company.positionname', 'zh_CN', '公司岗位', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10510', 'company.positionname', 'en_GB', 'position', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10511', 'company.parentcompanyname', 'zh_CN', '上级公司', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10512', 'company.parentcompanyname', 'en_GB', 'Superior Company', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10513', 'company.zipcode', 'zh_CN', '邮政编码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10514', 'company.zipcode', 'en_GB', 'zipcode', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10515', 'company.phone', 'zh_CN', '联系电话', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10516', 'company.phone', 'en_GB', 'phone', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10517', 'company.contactperson', 'zh_CN', '联系人', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10518', 'company.contactperson', 'en_GB', 'contact person', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10519', 'company.fax', 'zh_CN', '传真', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10520', 'company.fax', 'en_GB', 'fax', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10521', 'sys.config.select_file', 'zh_CN', '选择文件', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10522', 'sys.config.select_file', 'en_GB', 'Select File', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10523', 'sys.config.upload_file', 'zh_CN', '上传', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10524', 'sys.config.upload_file', 'en_GB', 'Upload', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10525', 'error.user.email', 'zh_CN', '请输入正确的Email信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10526', 'error.user.email', 'en_GB', 'Please enter the correct Email information', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10527', 'error.user.phone', 'zh_CN', '请输入正确的电话信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10528', 'error.user.phone', 'en_GB', 'Please enter the correct Phone information', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10529', 'hap.quicknavigation', 'zh_CN', '输入功能代码或功能名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10530', 'hap.quicknavigation', 'en_GB', 'Please input function code or name', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10531', 'error.account_no_role', 'zh_CN', '该账户下无有效角色', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10532', 'error.account_no_role', 'en_GB', 'this account has no valid role', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10533', 'sys.config.password_invalid_describe', 'zh_CN', '单位:天 ,0表示密码不过期', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10534', 'sys.config.password_invalid_describe', 'en_GB', 'Unit: day, 0 means password not expired', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10535', 'sys.dashboard.dashboardtitle', 'zh_CN', '标题', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10536', 'sys.dashboard.dashboardtitle', 'en_GB', 'Title', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10537', 'sys.dashboard.dashboardcode', 'zh_CN', '代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10538', 'sys.dashboard.dashboardcode', 'en_GB', 'Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10539', 'sys.dashboard.dashboardmainpage', 'zh_CN', '入口页面', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10540', 'sys.dashboard.dashboardmainpage', 'en_GB', 'Mainpage', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10541', 'sys.dashboard.dashboarddescription', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10542', 'sys.dashboard.dashboarddescription', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10543', 'job.infodetail.jobinfo', 'zh_CN', '任务参数', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10544', 'job.infodetail.jobinfo', 'en_GB', 'Job Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10545', 'job.infodetail.notification', 'zh_CN', '结束通知', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10546', 'job.infodetail.notification', 'en_GB', 'Notification', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10547', 'job.infodetail.enable_notification', 'zh_CN', '启用通知', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10548', 'job.infodetail.enable_notification', 'en_GB', 'Enable Nofitication', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10549', 'job.infodetail.email_address', 'zh_CN', '邮件地址', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10550', 'job.infodetail.email_address', 'en_GB', 'Email Address', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10551', 'job.jobdetail', 'zh_CN', '任务明细', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10552', 'job.jobdetail', 'en_GB', 'Job Details', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10553', 'simpletriggerdto.repeatinterval', 'zh_CN', '重复间隔', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10554', 'simpletriggerdto.repeatinterval', 'en_GB', 'Repeat Interval', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10555', 'simpletriggerdto.repeatcount', 'zh_CN', '重复次数', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10556', 'simpletriggerdto.repeatcount', 'en_GB', 'Repeat Count', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10557', 'generator.projectpath', 'zh_CN', '项目路径', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10558', 'generator.projectpath', 'en_GB', 'Project path', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10559', 'generator.parentpackagepath', 'zh_CN', '包父路径', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10560', 'generator.parentpackagepath', 'en_GB', 'Parent Package Path', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10561', 'generator.packagepath', 'zh_CN', '包路径', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10562', 'generator.packagepath', 'en_GB', 'Package Path', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10563', 'generator.choosetable', 'zh_CN', '选择表', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10564', 'generator.choosetable', 'en_GB', 'choose table', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10565', 'generator.filetype', 'zh_CN', '文件类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10566', 'generator.filetype', 'en_GB', 'File Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10567', 'generator.filename', 'zh_CN', '文件名', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10568', 'generator.filename', 'en_GB', 'File Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10569', 'generator.iscreate', 'zh_CN', '是否创建', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10570', 'generator.iscreate', 'en_GB', 'is Created', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10571', 'generator.iscover', 'zh_CN', '是否覆盖', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10572', 'generator.iscover', 'en_GB', 'is Cover', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10573', 'generator.htmlmodel', 'zh_CN', '选则ftl模板', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10574', 'generator.htmlmodel', 'en_GB', 'Choose FTL Template', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10575', 'generator.submit', 'zh_CN', '创建文件', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10576', 'generator.submit', 'en_GB', 'Create File', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10577', 'generator.needchoosetable', 'zh_CN', '请选择一个表', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10578', 'generator.needchoosetable', 'en_GB', 'Please Choose a Table', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10579', 'hrorgunit.companyname', 'zh_CN', '公司', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10580', 'hrorgunit.companyname', 'en_GB', 'Company', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10581', 'hap.copy', 'zh_CN', '复制', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10582', 'hap.copy', 'en_GB', 'Copy', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10583', 'hap.tip.selectrow', 'zh_CN', '请选择一行', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10584', 'hap.tip.selectrow', 'en_GB', 'Please Select One', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10585', 'hap.tip.selectrows', 'zh_CN', '请至少选择一行', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10586', 'hap.tip.selectrows', 'en_GB', 'Please Select At Least One', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10587', 'hap.typeorkey_empty', 'zh_CN', '参数附件类型或者附件索引值为空', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10588', 'hap.typeorkey_empty', 'en_GB', 'Type Or Key Empty', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10589', 'hap.type_error', 'zh_CN', '主目录中没有对应的附件类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10590', 'hap.type_error', 'en_GB', 'Type Error', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10591', 'hap.database_error', 'zh_CN', '数据库错误', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10592', 'hap.database_error', 'en_GB', 'Database Error', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10593', 'hap.mesg_unique', 'zh_CN', '该文件目录只允许上传一个文件', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10594', 'hap.mesg_unique', 'en_GB', 'Category Unique', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10595', 'hap.download', 'zh_CN', '下载', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10596', 'hap.download', 'en_GB', 'Download', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10597', 'hap.mesg_delete', 'zh_CN', '删除成功', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10598', 'hap.mesg_delete', 'en_GB', 'Deleted', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10599', 'message.sendflag', 'zh_CN', '发送状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10600', 'message.sendflag', 'en_GB', 'Send Status', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10601', 'message.templatetest', 'zh_CN', '模板邮件定义', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10602', 'message.templatetest', 'en_GB', 'Template Message', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10603', 'message.customtest', 'zh_CN', '自定义邮件定义', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10604', 'message.customtest', 'en_GB', 'Custom Message', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10605', 'message.rensend', 'zh_CN', '重新发送', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10606', 'message.rensend', 'en_GB', 'ReSend Message', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10607', 'messagetemplate.creationdate', 'zh_CN', '邮件创建时间', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10608', 'messagetemplate.creationdate', 'en_GB', 'Message Create Time', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10609', 'messagetemplate.lastupdatedate', 'zh_CN', '邮件更新时间', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10610', 'messagetemplate.lastupdatedate', 'en_GB', 'Message Update Time', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10611', 'hap.upload_success', 'zh_CN', '上传成功', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10612', 'hap.upload_success', 'en_GB', 'Upload Success', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10613', 'codevalue.orderseq', 'zh_CN', '排序号', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10614', 'codevalue.orderseq', 'en_GB', 'Order Seq', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10615', 'sys.login.safety', 'zh_CN', '登录策略', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10616', 'sys.login.safety', 'en_GB', 'Login Policy', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10617', 'sys.config.rolemerge', 'zh_CN', '角色合并', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10618', 'sys.config.rolemerge', 'en_GB', 'Role Merge', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10619', 'sys.config.user_role_merge.describe', 'zh_CN', '合并后，登录不在需要选择角色，菜单、权限都是合并后的', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10620', 'sys.config.user_role_merge.describe', 'en_GB', 'After the merger, the login is not need to select roles, menus, permissions are combined', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10621', 'sys.config.default_target_url', 'zh_CN', '跳转URL', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10622', 'sys.config.default_target_url', 'en_GB', 'Target URL', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10623', 'sys.config.default_target_url.describe', 'zh_CN', '登录成功以后跳转的URL', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10624', 'sys.config.default_target_url.describe', 'en_GB', 'Login successful redirect URL', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10625', 'interface.systemname', 'zh_CN', '系统名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10626', 'interface.systemname', 'en_GB', 'System Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10627', 'interface.interfacetype', 'zh_CN', '接口类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10628', 'interface.interfacetype', 'en_GB', 'Interface Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10629', 'interface.systemurl', 'zh_CN', '系统地址', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10630', 'interface.systemurl', 'en_GB', 'System URL', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10631', 'interface.requestmethod', 'zh_CN', '请求方式', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10632', 'interface.requestmethod', 'en_GB', 'Request Method', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10633', 'interface.requestformat', 'zh_CN', '请求形式', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10634', 'interface.requestformat', 'en_GB', 'Request Format', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10635', 'interface.mapperclass', 'zh_CN', '映射类', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10636', 'interface.mapperclass', 'en_GB', 'Mapper Class', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10637', 'interface.namespace', 'zh_CN', '命名空间', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10638', 'interface.namespace', 'en_GB', 'Namespace', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10639', 'interface.enableflag', 'zh_CN', '是否有效', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10640', 'interface.enableflag', 'en_GB', 'Enable Flag', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10641', 'interface.authflag', 'zh_CN', '是否校验', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10642', 'interface.authflag', 'en_GB', 'Auth Flag', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10643', 'interface.requestcontenttype', 'zh_CN', '请求报文格式', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10644', 'interface.requestcontenttype', 'en_GB', 'Request Content Type', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10645', 'interface.requestaccept', 'zh_CN', '请求接受类型', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10646', 'interface.requestaccept', 'en_GB', 'Request Accept', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10647', 'interface.checkusername', 'zh_CN', '校验用户名', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10648', 'interface.checkusername', 'en_GB', 'Check User Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10649', 'interface.checkpassword', 'zh_CN', '校验密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10650', 'interface.checkpassword', 'en_GB', 'Check Password', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10651', 'interface.soapheader', 'zh_CN', 'SOAP报文前缀', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10652', 'interface.soapheader', 'en_GB', 'SOAP Header', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10653', 'interface.soaptail', 'zh_CN', 'SOAP报文后缀', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10654', 'interface.soaptail', 'en_GB', 'SOAP Tail', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10655', 'interface.headeredit', 'zh_CN', '编辑接口信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10656', 'interface.headeredit', 'en_GB', 'Interface Header Edit', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10657', 'interface.lineedit', 'zh_CN', '查看接口信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10658', 'interface.lineedit', 'en_GB', 'View Interface', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10659', 'interface.line.interfacecode', 'zh_CN', '接口代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10660', 'interface.line.interfacecode', 'en_GB', 'Interface Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10661', 'interface.systemcode', 'zh_CN', '系统代码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10662', 'interface.systemcode', 'en_GB', 'System Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10663', 'interface.line.interfacename', 'zh_CN', '接口名称', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10664', 'interface.line.interfacename', 'en_GB', 'Interface Name', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10665', 'interface.lind.interfaceurl', 'zh_CN', '接口地址', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10666', 'interface.lind.interfaceurl', 'en_GB', 'Interface URL', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10667', 'interface.invoke.inbound', 'zh_CN', '入站请求', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10668', 'interface.invoke.inbound', 'en_GB', 'Inbound Request', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10669', 'interface.invoke.outbound', 'zh_CN', '出站请求', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10670', 'interface.invoke.outbound', 'en_GB', 'Outbound Request', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10671', 'interface.invoke.requeststatus', 'zh_CN', '请求状态', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10672', 'interface.invoke.requeststatus', 'en_GB', 'Request Status', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10673', 'interface.invoke.requesttime', 'zh_CN', '请求日期', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10674', 'interface.invoke.requesttime', 'en_GB', 'Request Date', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10675', 'interface.invoke.requestip', 'zh_CN', '用户IP', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10676', 'interface.invoke.requestip', 'en_GB', 'User IP', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10677', 'interface.invoke.responsetime', 'zh_CN', '响应时间', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10678', 'interface.invoke.responsetime', 'en_GB', 'Response Time', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10679', 'interface.invoke.detail', 'zh_CN', '详细信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10680', 'interface.invoke.detail', 'en_GB', 'Invoke Detail', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10681', 'interface.invoke.requestparameter', 'zh_CN', '请求参数', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10682', 'interface.invoke.requestparameter', 'en_GB', 'Request Parameter', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10683', 'interface.invoke.responsecode', 'zh_CN', 'HTTP CODE', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10684', 'interface.invoke.responsecode', 'en_GB', 'HTTP CODE', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10685', 'interface.invoke.requestbodyprm', 'zh_CN', '请求body', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10686', 'interface.invoke.requestbodyprm', 'en_GB', 'Body Parameter', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10687', 'interface.invoke.responsecontent', 'zh_CN', '响应内容', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10688', 'interface.invoke.responsecontent', 'en_GB', 'Response Date', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10689', 'interface.invoke.stacktrace', 'zh_CN', '错误堆栈', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10690', 'interface.invoke.stacktrace', 'en_GB', 'Stack Trace', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10691', 'interface.invoke.userreferer', 'zh_CN', 'Referer', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10692', 'interface.invoke.userreferer', 'en_GB', 'Referer', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10693', 'interface.invoke.useragent', 'zh_CN', 'User-Agent', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10694', 'interface.invoke.useragent', 'en_GB', 'User-Agent', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10695', 'interface.invoke.statsenddate', 'zh_CN', '开始日期', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10696', 'interface.invoke.statsenddate', 'en_GB', 'Begin Date', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10697', 'hap.error.uniqueexception', 'zh_CN', '数据重复', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10698', 'hap.error.uniqueexception', 'en_GB', 'Data Duplicated', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10699', 'hap.error.nullexception', 'zh_CN', '字段不能为空', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10700', 'hap.error.nullexception', 'en_GB', 'Field can not be null', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10701', 'hap.exportexcel', 'zh_CN', '导出Excel', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10702', 'hap.exportexcel', 'en_GB', 'Export Excel', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10703', 'interface.invoke.endsenddate', 'zh_CN', '截止日期', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10704', 'interface.invoke.endsenddate', 'en_GB', 'End Date', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10705', 'hap.invoke.apiname.interfacetranspond', 'zh_CN', '接口透传', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10706', 'hap.invoke.apiname.interfacetranspond', 'en_GB', 'Interface Transpond', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10707', 'resourcecustomization.sequence', 'zh_CN', '序列号', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10708', 'resourcecustomization.sequence', 'en_GB', 'Sequence', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10709', 'resourcecustomization.personalization', 'zh_CN', '个性化', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10710', 'resourcecustomization.personalization', 'en_GB', 'Personalization', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10711', 'sys.config.resetpassword', 'zh_CN', '首次登陆修改密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10712', 'sys.config.resetpassword', 'en_GB', 'First Login Reset Password', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10713', 'sys.config.resetpassword.describe', 'zh_CN', '首次登陆强制新用户修改密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10714', 'sys.config.resetpassword.describe', 'en_GB', 'After new user, the first landing force users to change passwords', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10715', 'employee.createnewuser', 'zh_CN', '添加为用户', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10716', 'employee.createnewuser', 'en_GB', 'create user', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10717', 'lovitem.conditionfieldlabelwidth', 'zh_CN', '查询描述宽度', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10718', 'lovitem.conditionfieldlabelwidth', 'en_GB', 'Label Width', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10719', 'lov.tip.querycolumnstip', 'zh_CN', '最多四列，建议不超过三列', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10720', 'lov.tip.querycolumnstip', 'en_GB', 'At most four ,suggest no more than three', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10721', 'hap.refresh', 'zh_CN', '刷新', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10722', 'hap.refresh', 'en_GB', 'Refresh', '1', '-1', '-1', '-1', '2017-03-27 15:25:30', '-1', '2017-03-27 15:25:30', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10723', 'hap.name', 'en_GB', 'name', '1', '-1', '-1', '10001', '2017-03-30 13:04:37', '10001', '2017-03-30 13:04:37', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10724', 'hap.name', 'zh_CN', '名字', '1', '-1', '-1', '10001', '2017-03-30 13:04:51', '10001', '2017-03-30 13:04:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10725', 'hap.email', 'en_GB', 'E-Mail', '1', '-1', '-1', '10001', '2017-03-31 20:21:41', '10001', '2017-03-31 20:21:41', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10726', 'hap.email', 'zh_CN', '邮箱', '1', '-1', '-1', '10001', '2017-03-31 20:21:56', '10001', '2017-03-31 20:21:56', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10727', 'hap.phonenumber', 'en_GB', 'phonenumber', '1', '-1', '-1', '10001', '2017-03-31 22:29:30', '10001', '2017-03-31 22:29:30', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10728', 'hap.phonenumber', 'zh_CN', '电话', '1', '-1', '-1', '10001', '2017-03-31 22:29:30', '10001', '2017-03-31 22:29:30', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10729', 'hap.birthday', 'en_GB', 'birthday', '1', '-1', '-1', '10001', '2017-03-31 22:30:43', '10001', '2017-03-31 22:30:43', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10730', 'hap.birthday', 'zh_CN', '生日', '1', '-1', '-1', '10001', '2017-03-31 22:30:43', '10001', '2017-03-31 22:30:43', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10731', 'hap.goodslist', 'zh_CN', '商品列表', '1', '-1', '-1', '10001', '2017-03-31 22:31:55', '10001', '2017-03-31 22:31:55', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10732', 'hap.goodslist', 'en_GB', 'goodslist', '1', '-1', '-1', '10001', '2017-03-31 22:32:09', '10001', '2017-03-31 22:32:09', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10733', 'hap.usergoodslist', 'zh_CN', '用户商品列表', '1', '-1', '-1', '10001', '2017-03-31 22:33:35', '10001', '2017-03-31 22:33:35', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10734', 'hap.usergoodslist', 'en_GB', 'usergoodslist', '1', '-1', '-1', '10001', '2017-03-31 22:33:49', '10001', '2017-03-31 22:33:49', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10735', 'sale.companysname', 'zh_CN', '公司名称', '1', '-1', '-1', '10001', '2017-04-04 20:25:43', '10001', '2017-04-04 20:25:43', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10736', 'sale.companysname', 'en_GB', 'companyname', '1', '-1', '-1', '10001', '2017-04-04 20:25:43', '10001', '2017-04-04 20:25:43', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10737', 'sale.customername', 'en_GB', 'customerName', '1', '-1', '-1', '10001', '2017-04-04 20:28:09', '10001', '2017-04-04 20:28:09', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10738', 'sale.customername', 'zh_CN', '客户名称', '1', '-1', '-1', '10001', '2017-04-04 20:28:24', '10001', '2017-04-04 20:28:24', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10739', 'sale.ordernumber', 'en_GB', 'orderNumber', '1', '-1', '-1', '10001', '2017-04-04 20:29:19', '10001', '2017-04-04 20:29:19', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10740', 'sale.ordernumber', 'zh_CN', '订单号', '1', '-1', '-1', '10001', '2017-04-04 20:29:31', '10001', '2017-04-04 20:29:31', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10741', 'sale.orderdate', 'en_GB', 'orderDate', '1', '-1', '-1', '10001', '2017-04-04 20:30:15', '10001', '2017-04-04 20:30:15', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10742', 'sale.orderdate', 'zh_CN', '订单日期', '1', '-1', '-1', '10001', '2017-04-04 20:30:31', '10001', '2017-04-04 20:30:31', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10743', 'sale.money', 'en_GB', 'money', '1', '-1', '-1', '10001', '2017-04-04 20:39:38', '10001', '2017-04-04 20:39:38', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10744', 'sale.money', 'zh_CN', '金额', '1', '-1', '-1', '10001', '2017-04-04 20:39:57', '10001', '2017-04-04 20:39:57', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10745', 'orderstatus', 'en_GB', 'orderStatus', '1', '-1', '-1', '10001', '2017-04-04 20:40:42', '10001', '2017-04-04 20:40:42', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10746', 'orderstatus', 'zh_CN', '订单状态', '1', '-1', '-1', '10001', '2017-04-04 20:40:56', '10001', '2017-04-04 20:40:56', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10747', 'sale.main', 'en_GB', 'main', '1', '-1', '-1', '10001', '2017-04-04 20:41:41', '10001', '2017-04-04 20:41:41', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10748', 'sale.main', 'zh_CN', '主要', '1', '-1', '-1', '10001', '2017-04-04 20:41:49', '10001', '2017-04-04 20:41:49', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10749', 'sale.other', 'en_GB', 'other', '1', '-1', '-1', '10001', '2017-04-04 20:42:23', '10001', '2017-04-04 20:42:23', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10750', 'sale.other', 'zh_CN', '其他', '1', '-1', '-1', '10001', '2017-04-04 20:42:32', '10001', '2017-04-04 20:42:32', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10751', 'sale.linenumber', 'en_GB', 'lineNumber', '1', '-1', '-1', '10001', '2017-04-04 20:44:00', '10001', '2017-04-04 20:44:00', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10752', 'sale.linenumber', 'zh_CN', '行号', '1', '-1', '-1', '10001', '2017-04-04 20:44:13', '10001', '2017-04-04 20:44:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10753', 'sale.itemcode', 'en_GB', 'itemCode', '1', '-1', '-1', '10001', '2017-04-04 20:45:31', '10001', '2017-04-04 20:45:31', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10754', 'sale.itemcode', 'zh_CN', '物料编码', '1', '-1', '-1', '10001', '2017-04-04 20:45:44', '10001', '2017-04-04 20:45:44', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10755', 'sale.itemdescription', 'en_GB', 'itemDescription', '1', '-1', '-1', '10001', '2017-04-04 20:46:36', '10001', '2017-04-04 20:46:36', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10756', 'sale.itemdescription', 'zh_CN', '物料描述', '1', '-1', '-1', '10001', '2017-04-04 20:46:49', '10001', '2017-04-04 20:46:49', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10757', 'sale.orderquantityuom', 'en_GB', 'orderQuantityUom', '1', '-1', '-1', '10001', '2017-04-04 20:47:49', '10001', '2017-04-04 20:47:49', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10758', 'sale.orderquantityuom', 'zh_CN', '产品单位', '1', '-1', '-1', '10001', '2017-04-04 20:48:17', '10001', '2017-04-04 20:48:17', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10759', 'vsale.orderdquantity', 'en_GB', 'orderdQuantity', '1', '-1', '-1', '10001', '2017-04-04 20:50:00', '10001', '2017-04-04 20:50:00', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10760', 'sale.orderdquantity', 'zh_CN', '数量', '1', '-1', '-1', '10001', '2017-04-04 20:50:14', '10001', '2017-04-04 20:50:14', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10761', 'sale.unitsellingprice', 'en_GB', 'unitSellingPrice', '1', '-1', '-1', '10001', '2017-04-04 20:51:38', '10001', '2017-04-04 20:51:38', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10762', 'sale.unitsellingprice', 'zh_CN', '单价', '1', '-1', '-1', '10001', '2017-04-04 20:51:50', '10001', '2017-04-04 20:51:50', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10763', 'sale.linesal', 'en_GB', 'lineSal', '1', '-1', '-1', '10001', '2017-04-04 20:52:48', '10001', '2017-04-04 20:52:48', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10764', 'sale.linesal', 'zh_CN', '金额', '1', '-1', '-1', '10001', '2017-04-04 20:53:01', '10001', '2017-04-04 20:53:01', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10765', 'sale.description', 'en_GB', 'description', '1', '-1', '-1', '10001', '2017-04-04 20:53:52', '10001', '2017-04-04 20:53:52', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10766', 'sale.description', 'zh_CN', '备注', '1', '-1', '-1', '10001', '2017-04-04 20:54:06', '10001', '2017-04-04 20:54:06', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10767', 'sale.message', 'en_GB', 'message', '1', '-1', '-1', '10001', '2017-04-04 20:56:56', '10001', '2017-04-04 20:56:56', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10768', 'sale.message', 'zh_CN', '附件信息', '1', '-1', '-1', '10001', '2017-04-04 20:57:13', '10001', '2017-04-04 20:57:13', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10769', 'sale.ordersumpages', 'en_GB', 'orderSumPages', '1', '-1', '-1', '10001', '2017-04-04 21:03:32', '10001', '2017-04-04 21:03:32', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10770', 'sale.ordersumpages', 'zh_CN', '销售订单汇总页面', '1', '-1', '-1', '10001', '2017-04-04 21:04:34', '10001', '2017-04-04 21:04:34', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10771', 'sale.orderdetails', 'en_GB', 'orderDetails', '1', '-1', '-1', '10001', '2017-04-04 21:08:45', '10001', '2017-04-04 21:08:45', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10772', 'sale.orderdetails', 'zh_CN', '订单明细', '1', '-1', '-1', '10001', '2017-04-04 21:09:06', '10001', '2017-04-04 21:09:06', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10773', 'sale.orderdetailspages', 'en_GB', 'orderDetailsPages', '1', '-1', '-1', '10001', '2017-04-04 21:13:55', '10001', '2017-04-04 21:13:55', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10774', 'sale.orderdetailspages', 'zh_CN', '订单详情页面', '1', '-1', '-1', '10001', '2017-04-04 21:14:10', '10001', '2017-04-04 21:14:10', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10775', 'sale.orderstatus', 'zh_CN', '订单状态', '1', '-1', '-1', '10001', '2017-04-04 21:17:25', '10001', '2017-04-04 21:17:25', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10776', 'sale.orderstatus', 'en_GB', 'orderStatus', '1', '-1', '-1', '10001', '2017-04-04 21:17:25', '10001', '2017-04-04 21:17:25', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_resource_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_b`;
CREATE TABLE `sys_resource_b` (
  `RESOURCE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) NOT NULL COMMENT 'URL',
  `TYPE` varchar(15) DEFAULT NULL COMMENT '资源类型',
  `NAME` varchar(40) DEFAULT NULL COMMENT '资源名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `LOGIN_REQUIRE` varchar(1) DEFAULT 'Y' COMMENT '是否需要登录',
  `ACCESS_CHECK` varchar(1) DEFAULT 'Y' COMMENT '是否权限校验',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`),
  UNIQUE KEY `SYS_RESOURCE_B_U1` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=10221 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_b
-- ----------------------------
INSERT INTO `sys_resource_b` VALUES ('10001', '403.html', 'HTML', '403', '403', 'N', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10002', '404.html', 'HTML', '404', '404', 'N', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10003', '500.html', 'HTML', '500', '500', 'N', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10004', 'activiti/models.html', 'HTML', '流程设计', null, 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10005', 'activiti/my_task.html', 'HTML', '我的代办', null, 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10006', 'activiti/process_definitions.html', 'HTML', '部署管理', null, 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10007', 'activiti/process_history.html', 'HTML', '流程历史', null, 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10008', 'activiti/start_process_test.html', 'HTML', '流程测试', null, 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10009', 'activiti/task_list.html', 'HTML', '代办事项(管理员)', null, 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10010', 'home.html', 'HTML', '首页', '首页', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10011', 'hr/employee.html', 'HTML', '员工', '员工', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10012', 'hr/employee/query', 'SERVICE', '员工查询', '员工查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10013', 'hr/employee/submit', 'SERVICE', '员工更新', '员工更新', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10014', 'hr/position.html', 'HTML', '岗位', '部门岗位', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10015', 'hr/position/query', 'SERVICE', '岗位查询', '岗位查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10016', 'hr/position/remove', 'SERVICE', '删除岗位', '删除岗位', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10017', 'hr/position/submit', 'SERVICE', '岗位修改', '岗位修改', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10018', 'hr/org_unit.html', 'HTML', '组织', '组织部门', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10019', 'hr/unit/query', 'SERVICE', '部门查询', '部门查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10020', 'hr/unit/remove', 'SERVICE', '删除部门', '删除部门', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10021', 'hr/unit/submit', 'SERVICE', '部门修改', '部门修改', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10022', 'index.html', 'HTML', '首页', '首页', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10023', 'job/job_detail.html', 'HTML', '任务明细', '任务明细', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10024', 'job/job_cron_add.html', 'HTML', '新建 CRON 任务', '新建CRON 任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10025', 'job/job_simple_add.html', 'HTML', '新建简单任务', '新建简单任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10026', 'job/job_infodetail.html', 'HTML', '任务详细', '任务详细', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10027', 'job/create', 'SERVICE', '新建任务', '新建任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10028', 'job/deletejob', 'SERVICE', '删除任务', '删除任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10029', 'job/pausejob', 'SERVICE', '暂停任务', '暂停任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10030', 'job/query', 'SERVICE', '查询任务', '查询任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10031', 'job/queryInfo', 'SERVICE', '查询任务列表', '查询任务列表', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10032', 'job/resumejob', 'SERVICE', '恢复任务', '恢复任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10033', 'job/job_running_info.html', 'HTML', '执行记录', '执行记录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10034', 'job/jobinfo/query', 'SERVICE', '查询任务日志', '查询任务日志', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10035', 'job/scheduler.html', 'HTML', '调度器', '调度器', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10036', 'job/scheduler/info', 'SERVICE', '调度器信息', '调度器信息', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10037', 'job/scheduler/pauseall', 'SERVICE', '暂停所有任务', '暂停所有任务', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10038', 'job/scheduler/query', 'SERVICE', '查询调度器', '查询调度器', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10039', 'job/scheduler/resumeall', 'SERVICE', '恢复所有任务', '恢复所有任务', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10040', 'job/scheduler/standby', 'SERVICE', '暂停调度器', '暂停调度器', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10041', 'job/scheduler/start', 'SERVICE', '启动调度器', '启动调度器', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10042', 'login.html', 'HTML', '登录', '登录', 'N', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10043', 'role.html', 'HTML', '角色选择', '角色选择', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10044', 'attach/sys_attach_category_edit.html', 'HTML', '目录编辑', '目录编辑', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10045', 'attach/sys_attach_category_manage.html', 'HTML', '目录管理', '目录管理', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10046', 'sys/attachcategory/query', 'SERVICE', '查询目录', '查询目录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10047', 'sys/attachcategory/remove', 'SERVICE', '删除目录', '删除目录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10048', 'sys/attachcategory/submit', 'SERVICE', '更新目录', '更新目录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10049', 'attach/sys_file_manage.html', 'HTML', '文件管理', '文件管理', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10050', 'sys/attachcategory/tree', 'SERVICE', '查询目录树', '查询目录树', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10051', 'sys/attach/file/queryFiles', 'SERVICE', '查询文件', '查询目录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10052', 'sys/attach/file/remove', 'SERVICE', '删除附件', '删除附件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10053', 'sys/attach/file/detail', 'SERVICE', '查看附件内容', '查看附件内容', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10054', 'sys/attach/file/view', 'SERVICE', '查看附件', '查看附件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10055', 'sys/attach/remove', 'SERVICE', '删除附件', '删除附件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10056', 'sys/attach/file/query', 'SERVICE', '查询目录文件', '查询目录文件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10057', 'sys/attach/manage', 'SERVICE', '附件列表', '附件列表', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10058', 'attach/sys_attachment_create.html', 'HTML', '上传测试', '上传测试', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10059', 'sys/attach/upload', 'SERVICE', '附件上传', '附件上传', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10060', 'sys/code/query', 'SERVICE', '查询快码', '查询快码', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10061', 'sys/code/remove', 'SERVICE', '删除快码', '删除快码', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10062', 'sys/code/submit', 'SERVICE', '更新快码', '更新快码', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10063', 'sys/codevalue/query', 'SERVICE', '查询快码值', '查询快码值', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10064', 'sys/codevalue/remove', 'SERVICE', '删除快码值', '删除快码值', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10065', 'sys/sys_function.html', 'HTML', '功能管理', '功能管理', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10066', 'sys_function_resource.html', 'HTML', '功能资源', '功能资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10067', 'sys/sys_function_addresource.html', 'HTML', '添加资源', '添加资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10068', 'sys/function/fetchNotResource', 'SERVICE', '获取未分配资源', '获取未分配资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10069', 'sys/function/fetchResource', 'SERVICE', '获取已分配资源', '获取已分配资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10070', 'sys/function/menus', 'SERVICE', '获取菜单', '获取菜单', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10071', 'sys/function/query', 'SERVICE', '查询功能', '查询功能', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10072', 'sys/function/remove', 'SERVICE', '删除功能', '删除功能', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10073', 'sys/function/submit', 'SERVICE', '更新功能', '更新功能', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10074', 'sys/function/updateFunctionResource', 'SERVICE', '更新功能资源', '更新功能资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10075', 'sys/sys_language.html', 'HTML', '语言维护', '语言维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10076', 'sys/language/delete', 'SERVICE', '删除语言', '删除语言', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10077', 'sys/language/query', 'SERVICE', '查询语言', '查询语言', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10078', 'sys/language/submit', 'SERVICE', '更新语言', '更新语言', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10079', 'sys/lov/load', 'SERVICE', '加载 LOV', '加载 LOV', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10080', 'sys/lov/query', 'SERVICE', '查询 LOV', '查询 LOV', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10081', 'sys/lov/remove', 'SERVICE', '删除 LOV', '删除 LOV', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10082', 'sys/lov/submit', 'SERVICE', '更新 LOV', '更新 LOV', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10083', 'sys/lovitem/query', 'SERVICE', '查询 LOV 列', '查询 LOV 列', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10084', 'sys/lovitem/remove', 'SERVICE', '删除 LOV 列', '删除 LOV 列', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10085', 'mail/sys_message_email_config.html', 'HTML', '邮件账户', '邮件账户', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10086', 'mail/sys_message_email_config_edit.html', 'HTML', '编辑邮件配置', '编辑邮件配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10087', 'sys/messageEmailAccount/query', 'SERVICE', '查询邮件账户', '查询邮件账户', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10088', 'sys/messageEmailAccount/remove', 'SERVICE', '删除邮件账户', '删除邮件账户', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10089', 'sys/messageEmailConfig/load', 'SERVICE', '加载邮件配置', '加载邮件配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10090', 'sys/messageEmailConfig/query', 'SERVICE', '查询邮件配置', '查询邮件配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10091', 'sys/messageEmailConfig/queryMsgConfigQuanties', 'SERVICE', '查询邮件配置数量', '查询配置数量', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10092', 'sys/messageEmailConfig/remove', 'SERVICE', '删除邮件配置', '删除邮件配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10093', 'sys/messageEmailConfig/submit', 'SERVICE', '更新邮件配置', '更新邮件配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10094', 'sys/messageEmailWhiteList/query', 'SERVICE', '查询邮件白名单', '查询邮件白名单', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10095', 'sys/messageEmailWhiteList/remove', 'SERVICE', '删除邮件白名单', '删除邮件白名单', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10096', 'mail/sys_message_template.html', 'HTML', '邮件模板', '邮件模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10097', 'mail/sys_message_template_edit.html', 'HTML', '编辑模板', '编辑模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10098', 'sys/messageTemplate/add', 'SERVICE', '新建模板', '新建模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10099', 'sys/messageTemplate/query', 'SERVICE', '查询模板', '查询模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10100', 'sys/messageTemplate/remove', 'SERVICE', '删除模板', '删除模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10101', 'sys/messageTemplate/update', 'SERVICE', '更新模板', '更新模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10102', 'mail/sys_message_test.html', 'HTML', '邮件测试', '邮件测试', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10103', 'sys/message/sendTest', 'SERVICE', '邮件发送测试', '邮件发送测试', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10104', 'sys/preferences/queryPreferences', 'SERVICE', '查询首选项', '查询首选项', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10105', 'sys/preferences/savePreferences', 'SERVICE', '保存首选项', '保存首选项', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10106', 'sys/profile/query', 'SERVICE', '查询配置', '查询配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10107', 'sys/profile/remove', 'SERVICE', '删除配置', '删除配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10108', 'sys/profile/submit', 'SERVICE', '更新配置', '更新配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10109', 'sys/profilevalue/query', 'SERVICE', '查询配置值', '查询配置值', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10110', 'sys/profilevalue/querylevelvalues', 'SERVICE', '查询指定级别的配置值', '查询指定级别的配置值', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10111', 'sys/profilevalue/remove', 'SERVICE', '删除配置值', '删除配置值', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10112', 'sys/prompt/query', 'SERVICE', '查询描述', '查询描述', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10113', 'sys/prompt/remove', 'SERVICE', '删除描述', '删除描述', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10114', 'sys/prompt/submit', 'SERVICE', '更改描述', '更改描述', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10115', 'sys/sys_resource.html', 'HTML', '资源注册', '资源注册', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10116', '/sys/resourceCustomization/submit', 'SERVICE', '更新个性化组件', '更新个性化组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10117', '/sys/resourceCustomization/query', 'SERVICE', '查询个性化组件', '查询个性化组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10118', '/sys/resourceCustomization/remove', 'SERVICE', '删除个性化组件', '删除个性化组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10119', 'sys/sys_resource_customization.html', 'HTML', '个性化组件', '个性化组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10120', 'sys/sys_resource_item.html', 'HTML', '资源组件', '资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10121', 'sys/sys_role_resource_item.html', 'HTML', '分配资源组件', '分配资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10122', 'sys/resource/query', 'SERVICE', '查询资源', '查询资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10123', 'sys/resource/remove', 'SERVICE', '删除资源', '删除资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10124', 'sys/resource/submit', 'SERVICE', '更新资源', '更新资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10125', 'sys/resourceItem/query', 'SERVICE', '查询资源组件', '查询资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10126', 'sys/resourceItem/remove', 'SERVICE', '删除资源组件', '删除资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10127', 'sys/resourceItem/submit', 'SERVICE', '更新资源组件', '更新资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10128', 'sys/role/queryRoleNotUserRole', 'SERVICE', '选择非当前角色', '选择非当前角色', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10129', 'sys/sys_role_function.html', 'HTML', '功能分配', '功能分配', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10130', 'sys/rolefunction/query', 'SERVICE', '查询角色功能', '查询角色功能', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10131', 'sys/rolefunction/queryResourceItems', 'SERVICE', '查询功能资源组件', '查询功能资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10132', 'sys/rolefunction/submit', 'SERVICE', '更新角色功能', '更新角色功能', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10133', 'sys/rolefunction/submitResourceItems', 'SERVICE', '更新功能资源组件', '更新资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10134', 'sys/sys_code.html', 'HTML', '代码维护', '代码维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10135', 'sys/sys_code_edit.html', 'HTML', '编辑快码', '编辑快码', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10136', 'sys/sys_config.html', 'HTML', '系统配置', '系统配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10137', 'sys/sys_lov.html', 'HTML', 'LOV维护', 'LOV维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10138', 'sys/sys_lov_edit.html', 'HTML', '编辑 LOV', '编辑 LOV', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10139', 'sys/sys_lov_preview.html', 'HTML', 'LOV 预览', 'LOV 预览', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10140', 'sys/sys_multilanguage_editor.html', 'HTML', '多语言编辑器', '多语言编辑器', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10141', 'sys/sys_profile.html', 'HTML', '配置维护', '配置维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10142', 'sys/sys_profile_edit.html', 'HTML', '编辑配置文件', '编辑配置文件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10143', 'sys/sys_prompt.html', 'HTML', '描述维护', '描述维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10144', 'sys/sys_role.html', 'HTML', '角色管理', '角色管理', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10145', 'sys/role/delete', 'SERVICE', '角色删除', '角色删除', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10146', 'sys/role/query', 'SERVICE', '角色查询', '角色查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10147', 'sys/role/submit', 'SERVICE', '角色更新', '角色更新', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10148', 'sys/sys_user.html', 'HTML', '用户管理', '用户管理', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10149', 'sys/sys_user_role.html', 'HTML', '角色分配', '角色分配', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10150', 'sys/sys_user_chooserole.html', 'HTML', '选择角色', '选择角色', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10151', 'sys/user/query', 'SERVICE', '用户查询', '用户查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10152', 'sys/user/remove', 'SERVICE', '删除用户', '删除用户', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10153', 'sys/user/submit', 'SERVICE', '更新用户', '更新用户', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10154', 'sys/userrole/queryUserRoles', 'SERVICE', '查询用户角色', '查询用户角色', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10155', 'sys/userrole/submit', 'SERVICE', '保存用户角色', '保存用户角色', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10156', 'sys/um/getSingleUser', 'SERVICE', '单条用户信息', '单条用户信息', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10157', 'sys/um/isExistsEmail', 'SERVICE', '用户邮件检查', '用户邮件检查', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10158', 'sys/um/isExistsPhone', 'SERVICE', '电话号码检查', '电话号码检查', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10159', 'sys/um/isExistsUser', 'SERVICE', '用户是否存在', '用户是否存在', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10160', 'sys/um/query', 'SERVICE', '用户信息查询', '用户信息查询', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10161', 'sys/um/sys_login_success.html', 'HTML', '登录成功', '登录成功', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10162', 'sys/um/sys_update_password.html', 'HTML', '更改密码', '更改密码', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10163', 'sys/um/sys_user_info.html', 'HTML', '用户信息', '用户信息', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10164', 'sys/um/updatePassword', 'SERVICE', '更改密码', '更改密码', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10165', 'sys/um/updateUserInfo', 'SERVICE', '更新个人信息', '更新个人信息', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10166', 'sys_icon.html', 'HTML', '图标选择', '图标选择', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10167', 'timeout.html', 'HTML', '超时', '超时', 'N', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10168', 'verifiCode', 'SERVICE', '验证码服务', '验证码服务', 'N', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10169', 'fnd/company.html', 'HTML', '公司维护', '公司信息维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10170', 'fnd/company/update', 'SERVICE', '公司信息修改', '公司信息修改', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10171', 'fnd/company/query', 'SERVICE', '公司信息查询', '公司信息查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10172', 'fnd/company/remove', 'SERVICE', '公司信息删除', '公司信息删除', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10173', 'fnd/company_edit.html', 'HTML', '公司编辑界面', '公司编辑界面', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10174', 'sys/sys_dashboard.html', 'HTML', '仪表盘配置界面', '仪表盘配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10175', 'sys/sys_dashboard/query', 'SERVICE', '查询仪表盘', '查询仪表盘', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10176', 'sys/sys_dashboard/submit', 'SERVICE', '更新仪表盘', '更新仪表盘', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10177', 'sys/sys_dashboard/remove', 'SERVICE', '删除仪表盘', '删除仪表盘', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10178', 'dashboard/task.html', 'SERVICE', '代办事项', '代办事项', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10179', 'sys/sys_jvm_metrics.html', 'HTML', '系统JVM指标', '系统JVM指标', 'Y', 'N', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10180', 'mail/message_status.html', 'HTML', '邮件状态查询', '邮件状态查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10181', 'intergration/sys_interface_invoke.html', 'HTML', '接口调用记录', '接口调用记录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10182', 'intergration/sys_interface_header.html', 'HTML', '接口定义界面', '接口定义界面', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10183', 'intergration/sys_interface_header_edit.html', 'HTML', '接口系统信息', '接口系统信息', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10184', 'intergration/sys_interface_line_edit.html', 'HTML', '接口修改页面', '接口修改页面', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10185', 'sys/sys_detail_metrics.html', 'HTML', '系统指标详情页', '系统指标详情页', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10186', 'sys/message/query', 'SERVICE', '邮件状态查询', '邮件状态查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10187', 'message/error_mess', 'SERVICE', '邮件错误信息查询', '邮件错误信息查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10188', 'sys/um/resetPasswordAdmin', 'SERVICE', '管理员修改用户密码', '管理员修改用户密码', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10195', 'test/testUser.html', 'HTML', '测试用户页面', '测试用户页面', 'Y', 'N', '1', '-1', '-1', '10001', '2017-03-31 19:53:06', '10001', '2017-03-31 19:53:06', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10196', 'test/testGoods.html', 'HTML', '测试商品页面', '测试商品页面', 'N', 'N', '1', '-1', '-1', '10001', '2017-03-31 19:54:14', '10001', '2017-03-31 19:54:14', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10197', 'test/user/queryAll', 'SERVICE', '查询用户', '查询用户', 'N', 'N', '2', '-1', '-1', '10001', '2017-03-31 19:55:22', '10001', '2017-03-31 19:55:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10198', 'test/test_user_goods.html', 'HTML', '测试用户商品页面', '测试用户商品页面', 'N', 'N', '1', '-1', '-1', '10001', '2017-03-31 19:56:56', '10001', '2017-03-31 19:56:56', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10200', 'sale/saleDetails.html', 'HTML', '销售明细页面', '销售明细页面', 'N', 'N', '1', '-1', '-1', '10001', '2017-04-01 10:17:42', '10001', '2017-04-01 10:17:42', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10201', 'order/orderHeader/query', 'SERVICE', '查询订单汇总', '查询订单汇总', 'N', 'N', '2', '-1', '-1', '10001', '2017-04-03 09:40:25', '10001', '2017-04-03 12:51:20', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10202', 'sale/orderLines/query', 'SERVICE', '订单明细页面', '订单明细页面', 'N', 'N', '1', '-1', '-1', '10001', '2017-04-03 15:54:03', '10001', '2017-04-03 15:54:03', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10203', 'sale/orderHeader/export', 'SERVICE', '2', '2', 'N', 'N', '1', '-1', '-1', '10001', '2017-04-04 13:01:14', '10001', '2017-04-04 13:01:14', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10204', 'sale/saleSum.html', 'HTML', '123', '123', 'N', 'N', '2', '-1', '-1', '10001', '2017-04-05 13:10:03', '10001', '2017-04-05 14:32:32', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10205', 'set/transactionType.html', 'HTML', '事务类型', '事务类型', 'N', 'N', '2', '-1', '-1', '10001', '2017-04-19 18:06:36', '10001', '2017-04-19 18:29:52', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10206', 'set/interface.html', 'HTML', '接口设置界面', '接口设置界面', 'N', 'N', '2', '-1', '-1', '10001', '2017-04-19 18:40:45', '10001', '2017-04-19 18:42:00', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10207', 'hssp/trx_type.html', 'HTML', '事务类型界面', '事务类型', 'N', 'N', '2', '-1', '-1', '10001', '2017-04-21 11:31:57', '10001', '2017-04-21 11:36:02', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10208', 'hssp/task_item_header.html', 'HTML', '通用接口页面', '通用接口页面', 'N', 'N', '2', '-1', '-1', '10001', '2017-04-21 11:33:17', '10001', '2017-04-21 11:35:54', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10210', 'hssp/task_item_line.html', 'HTML', '接口新建界面', '接口新建界面', 'N', 'N', '3', '-1', '-1', '10001', '2017-04-21 12:01:02', '10001', '2017-05-17 16:51:25', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10211', 'hssp/trxDetail/query', 'SERVICE', '细节页面', '细节页面', 'N', 'N', '1', '-1', '-1', '10001', '2017-04-21 21:13:19', '10001', '2017-04-21 21:13:19', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10212', 'work/tax_type.html', 'HTML', '123', null, 'N', 'N', '1', '-1', '-1', '10001', '2017-06-17 10:35:41', '10001', '2017-06-17 10:35:41', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10213', 'work/trx_detail.html', 'HTML', '234', null, 'N', 'N', '1', '-1', '-1', '10001', '2017-06-17 10:36:12', '10001', '2017-06-17 10:36:12', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10214', 'trx/trxType/query', 'SERVICE', '6', null, 'N', 'N', '1', '-1', '-1', '10001', '2017-06-17 10:39:36', '10001', '2017-06-17 10:39:36', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10215', 'basic_setting/tra_type.html', 'HTML', '8', null, 'N', 'N', '2', '-1', '-1', '10001', '2017-06-17 13:31:26', '10001', '2017-06-17 16:10:34', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10216', 'basic_setting/trx_detail.html', 'HTML', '9', null, 'N', 'N', '1', '-1', '-1', '10001', '2017-06-17 13:31:49', '10001', '2017-06-17 13:31:49', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10217', 'basic_setting/item_header.html', 'HTML', '111', null, 'N', 'N', '2', '-1', '-1', '10001', '2017-06-17 13:56:05', '10001', '2017-06-17 17:05:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10218', 'basic_setting/itemHeader/query', 'SERVICE', 'u', null, 'N', 'N', '2', '-1', '-1', '10001', '2017-06-17 13:58:32', '10001', '2017-06-17 17:05:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10219', 'aaa/TrxType/aaa/TrxType', 'SERVICE', 'chaxun', null, 'Y', 'Y', '1', '-1', '-1', '10001', '2017-06-17 16:13:15', '10001', '2017-06-17 16:13:15', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10220', 'basic_setting/item_line.html', 'HTML', '接口行', null, 'N', 'N', '1', '-1', '-1', '10001', '2017-06-18 10:21:06', '10001', '2017-06-18 10:21:06', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_resource_customization
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_customization`;
CREATE TABLE `sys_resource_customization` (
  `RESOURCE_CUSTOMIZATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '外键，资源ID',
  `URL` varchar(255) NOT NULL COMMENT 'URL',
  `SEQUENCE` int(11) NOT NULL COMMENT '序列号',
  `ENABLE_FLAG` varchar(1) NOT NULL DEFAULT 'N' COMMENT '是否激活',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`RESOURCE_CUSTOMIZATION_ID`),
  KEY `SYS_RESOURCE_CUSTOMIZATION_N1` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_customization
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource_item_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_item_b`;
CREATE TABLE `sys_resource_item_b` (
  `RESOURCE_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OWNER_RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '功能资源ID',
  `TARGET_RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '目标资源ID',
  `ITEM_ID` varchar(50) DEFAULT NULL COMMENT 'HTML中控件ID',
  `ITEM_NAME` varchar(50) DEFAULT NULL COMMENT '控件名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `ITEM_TYPE` varchar(10) DEFAULT NULL COMMENT '控件类型',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ITEM_ID`),
  UNIQUE KEY `SYS_RESOURCE_ITEM_B_U1` (`ITEM_ID`,`OWNER_RESOURCE_ID`),
  KEY `SYS_RESOURCE_ITEM_B_N1` (`OWNER_RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_item_b
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource_item_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_item_tl`;
CREATE TABLE `sys_resource_item_tl` (
  `RESOURCE_ITEM_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `ITEM_NAME` varchar(150) DEFAULT NULL COMMENT '控件名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ITEM_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_item_tl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_tl`;
CREATE TABLE `sys_resource_tl` (
  `RESOURCE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL COMMENT '资源名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_tl
-- ----------------------------
INSERT INTO `sys_resource_tl` VALUES ('10001', 'en_GB', '403', '403', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10001', 'zh_CN', '403', '403', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10002', 'en_GB', '404', '404', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10002', 'zh_CN', '404', '404', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10003', 'en_GB', '500', '500', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10003', 'zh_CN', '500', '500', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10004', 'en_GB', 'Process Design', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10004', 'zh_CN', '流程设计', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10005', 'en_GB', 'My Tasks', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10005', 'zh_CN', '我的代办', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10006', 'en_GB', 'Deployments', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10006', 'zh_CN', '部署管理', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10007', 'en_GB', 'Process History', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10007', 'zh_CN', '流程历史', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10008', 'en_GB', 'Process Test', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10008', 'zh_CN', '流程测试', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10009', 'en_GB', 'Tasks (ADMIN)', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10009', 'zh_CN', '代办事项(管理员)', null, '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10010', 'en_GB', 'Home', 'Home', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10010', 'zh_CN', '首页', '首页', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10011', 'en_GB', 'Employee', 'Employee', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10011', 'zh_CN', '员工', '员工', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10012', 'en_GB', 'Query Employee', 'Query Employee', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10012', 'zh_CN', '员工查询', '员工查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10013', 'en_GB', 'Update Employee', 'Update Employee', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10013', 'zh_CN', '员工更新', '员工更新', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10014', 'en_GB', 'Position', 'Unit Position', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10014', 'zh_CN', '岗位', '部门岗位', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10015', 'en_GB', 'Query Position', 'Query Position', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10015', 'zh_CN', '岗位查询', '岗位查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10016', 'en_GB', 'Remove Position', 'Remove Position', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10016', 'zh_CN', '删除岗位', '删除岗位', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10017', 'en_GB', 'Modify Position', 'Modify Position', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10017', 'zh_CN', '岗位修改', '岗位修改', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10018', 'en_GB', 'unit', 'unit', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10018', 'zh_CN', '组织', '组织部门', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10019', 'en_GB', 'query unit', 'query unit', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10019', 'zh_CN', '部门查询', '部门查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10020', 'en_GB', 'remove unit', 'remove unit', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10020', 'zh_CN', '删除部门', '删除部门', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10021', 'en_GB', 'submit unit change', 'submit unit change', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10021', 'zh_CN', '部门修改', '部门修改', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10022', 'en_GB', 'Index', 'Index', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10022', 'zh_CN', '首页', '首页', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10023', 'en_GB', 'Job Details', 'Job Details', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10023', 'zh_CN', '任务明细', '任务明细', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10024', 'en_GB', 'Add Cron Job', 'Add Cron Job', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10024', 'zh_CN', '新建 CRON 任务', '新建CRON 任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10025', 'en_GB', 'Add Simple Job', 'Add Simple Job', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10025', 'zh_CN', '新建简单任务', '新建简单任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10026', 'en_GB', 'Job Detail Info', 'Job Detail Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10026', 'zh_CN', '任务详细', '任务详细', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10027', 'en_GB', 'Create Job', 'Create Job', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10027', 'zh_CN', '新建任务', '新建任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10028', 'en_GB', 'Delete Job', 'Delete Job', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10028', 'zh_CN', '删除任务', '删除任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10029', 'en_GB', 'Pause Job', 'Pause Job', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10029', 'zh_CN', '暂停任务', '暂停任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10030', 'en_GB', 'Query Job', 'Query Job', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10030', 'zh_CN', '查询任务', '查询任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10031', 'en_GB', 'Query Job Info', 'Query Job Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10031', 'zh_CN', '查询任务列表', '查询任务列表', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10032', 'en_GB', 'Resume Job', 'Resume Job', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10032', 'zh_CN', '恢复任务', '恢复任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10033', 'en_GB', 'Execution Summary', 'Execution Summary', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10033', 'zh_CN', '执行记录', '执行记录', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10034', 'en_GB', 'Query Job Log', 'Query Job Log', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10034', 'zh_CN', '查询任务日志', '查询任务日志', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10035', 'en_GB', 'Scheduler', 'Scheduler', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10035', 'zh_CN', '调度器', '调度器', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10036', 'en_GB', 'Scheduler Info', 'Scheduler Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10036', 'zh_CN', '调度器信息', '调度器信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10037', 'en_GB', 'Pause All Jobs', 'Pause All Jobs', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10037', 'zh_CN', '暂停所有任务', '暂停所有任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10038', 'en_GB', 'Query Scheduler', 'Query Schedulers', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10038', 'zh_CN', '查询调度器', '查询调度器', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10039', 'en_GB', 'Resume All Jobs', 'Resume All Jobs', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10039', 'zh_CN', '恢复所有任务', '恢复所有任务', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10040', 'en_GB', 'Standby Scheduler', 'Standby Scheduler', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10040', 'zh_CN', '暂停调度器', '暂停调度器', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10041', 'en_GB', 'Start Scheduler', 'Start Scheduler', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10041', 'zh_CN', '启动调度器', '启动调度器', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10042', 'en_GB', 'Login', 'Login', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10042', 'zh_CN', '登录', '登录', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10043', 'en_GB', 'Role Select', 'Role Select', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10043', 'zh_CN', '角色选择', '角色选择', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10044', 'en_GB', 'Category Edit', 'Category Edit', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10044', 'zh_CN', '目录编辑', '目录编辑', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10045', 'en_GB', 'Category', 'Category', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10045', 'zh_CN', '目录管理', '目录管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10046', 'en_GB', 'Query Category', 'Query Category', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10046', 'zh_CN', '查询目录', '查询目录', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10047', 'en_GB', 'Delete Category', 'Delete Category', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10047', 'zh_CN', '删除目录', '删除目录', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10048', 'en_GB', 'Update Category', 'Update Category', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10048', 'zh_CN', '更新目录', '更新目录', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10049', 'en_GB', 'Files', 'Files', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10049', 'zh_CN', '文件管理', '文件管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10050', 'en_GB', 'Query Category Tree', 'Query Category Tree', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10050', 'zh_CN', '查询目录树', '查询目录树', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10051', 'en_GB', 'Query Files', 'Query Files', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10051', 'zh_CN', '查询文件', '查询目录', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10052', 'en_GB', 'Delete File', 'Delete Files', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10052', 'zh_CN', '删除附件', '删除附件', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10053', 'en_GB', 'Attachment Detail', 'Attachment Detail', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10053', 'zh_CN', '查看附件内容', '查看附件内容', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10054', 'en_GB', 'View Attachment', 'View Attachment', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10054', 'zh_CN', '查看附件', '查看附件', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10055', 'en_GB', 'Delete Attachment', 'Delete Attachment', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10055', 'zh_CN', '删除附件', '删除附件', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10056', 'en_GB', 'Query Category Files', 'Query Category Files', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10056', 'zh_CN', '查询目录文件', '查询目录文件', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10057', 'en_GB', 'Attachment List', 'Attachment List', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10057', 'zh_CN', '附件列表', '附件列表', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10058', 'en_GB', 'Upload Test', 'Upload Test', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10058', 'zh_CN', '上传测试', '上传测试', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10059', 'en_GB', 'Attachment Upload', 'Attachment Upload', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10059', 'zh_CN', '附件上传', '附件上传', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10060', 'en_GB', 'Query Code', 'Query Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10060', 'zh_CN', '查询快码', '查询快码', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10061', 'en_GB', 'Delete Code', 'Delete Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10061', 'zh_CN', '删除快码', '删除快码', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10062', 'en_GB', 'Update Code', 'Update Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10062', 'zh_CN', '更新快码', '更新快码', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10063', 'en_GB', 'Query Code Value', 'Query Code Value', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10063', 'zh_CN', '查询快码值', '查询快码值', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10064', 'en_GB', 'Delete Code Value', 'Query Code Value', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10064', 'zh_CN', '删除快码值', '删除快码值', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10065', 'en_GB', 'Function', 'Function', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10065', 'zh_CN', '功能管理', '功能管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10066', 'en_GB', 'Function Resource', 'Function Resource', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10066', 'zh_CN', '功能资源', '功能资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10067', 'en_GB', 'Add Resource', 'Add Resource', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10067', 'zh_CN', '添加资源', '添加资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10068', 'en_GB', 'Fetch Unassigned Resource', 'Fetch Unassigned Resource', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10068', 'zh_CN', '获取未分配资源', '获取未分配资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10069', 'en_GB', 'Fetch Assigned Resource', 'Fetch Assigned Resouce', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10069', 'zh_CN', '获取已分配资源', '获取已分配资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10070', 'en_GB', 'Menus', 'Get Menus', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10070', 'zh_CN', '获取菜单', '获取菜单', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10071', 'en_GB', 'Query Funcitons', 'Query Functions', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10071', 'zh_CN', '查询功能', '查询功能', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10072', 'en_GB', 'Delete Function', 'Delete Functions', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10072', 'zh_CN', '删除功能', '删除功能', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10073', 'en_GB', 'Update Fuction', 'Update Function', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10073', 'zh_CN', '更新功能', '更新功能', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10074', 'en_GB', 'Update Function Resource', 'Update Function Resource', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10074', 'zh_CN', '更新功能资源', '更新功能资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10075', 'en_GB', 'Language', 'Language', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10075', 'zh_CN', '语言维护', '语言维护', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10076', 'en_GB', 'Delete Language', 'Delete Language', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10076', 'zh_CN', '删除语言', '删除语言', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10077', 'en_GB', 'Query Language', 'Query Language', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10077', 'zh_CN', '查询语言', '查询语言', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10078', 'en_GB', 'Update Language', 'Update Language', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10078', 'zh_CN', '更新语言', '更新语言', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10079', 'en_GB', 'Load Lov', 'Load Lov', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10079', 'zh_CN', '加载 LOV', '加载 LOV', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10080', 'en_GB', 'Query Lov', 'Query Lov', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10080', 'zh_CN', '查询 LOV', '查询 LOV', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10081', 'en_GB', 'Delete Lov', 'Delete Lov', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10081', 'zh_CN', '删除 LOV', '删除 LOV', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10082', 'en_GB', 'Update Lov', 'Update Lov', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10082', 'zh_CN', '更新 LOV', '更新 LOV', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10083', 'en_GB', 'Query Lov Item', 'Query Lov Item', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10083', 'zh_CN', '查询 LOV 列', '查询 LOV 列', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10084', 'en_GB', 'Delete Lov Item', 'Delete Lov Item', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10084', 'zh_CN', '删除 LOV 列', '删除 LOV 列', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10085', 'en_GB', 'Email Account', 'Email Account', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10085', 'zh_CN', '邮件账户', '邮件账户', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10086', 'en_GB', 'Edit Email Config', 'Edit Email Config', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10086', 'zh_CN', '编辑邮件配置', '编辑邮件配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10087', 'en_GB', 'Query Email Account', 'Query Email Acount', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10087', 'zh_CN', '查询邮件账户', '查询邮件账户', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10088', 'en_GB', 'Delete Email Account', 'Delete Email Account', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10088', 'zh_CN', '删除邮件账户', '删除邮件账户', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10089', 'en_GB', 'Load Email Config', 'Load Email Config', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10089', 'zh_CN', '加载邮件配置', '加载邮件配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10090', 'en_GB', 'Query Email Config', 'Query Email Config', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10090', 'zh_CN', '查询邮件配置', '查询邮件配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10091', 'en_GB', 'Query Config Count', 'Query Config Count', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10091', 'zh_CN', '查询邮件配置数量', '查询配置数量', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10092', 'en_GB', 'Delete Email Config', 'Delete Email Config', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10092', 'zh_CN', '删除邮件配置', '删除邮件配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10093', 'en_GB', 'Update Email Config', 'Update Email Config', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10093', 'zh_CN', '更新邮件配置', '更新邮件配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10094', 'en_GB', 'Query White List', 'Query Email White List', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10094', 'zh_CN', '查询邮件白名单', '查询邮件白名单', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10095', 'en_GB', 'Delete White List', 'Delete White List', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10095', 'zh_CN', '删除邮件白名单', '删除邮件白名单', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10096', 'en_GB', 'Email Template', 'Email Template', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10096', 'zh_CN', '邮件模板', '邮件模板', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10097', 'en_GB', 'Edit Template', 'Edit Template', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10097', 'zh_CN', '编辑模板', '编辑模板', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10098', 'en_GB', 'Add Template', 'Add Template', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10098', 'zh_CN', '新建模板', '新建模板', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10099', 'en_GB', 'Query Template', 'Query Template', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10099', 'zh_CN', '查询模板', '查询模板', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10100', 'en_GB', 'Delete Template', 'Delete Template', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10100', 'zh_CN', '删除模板', '删除模板', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10101', 'en_GB', 'Update Tempate', 'Update Template', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10101', 'zh_CN', '更新模板', '更新模板', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10102', 'en_GB', 'Email Test', 'Email Test', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10102', 'zh_CN', '邮件测试', '邮件测试', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10103', 'en_GB', 'Email Send Test', 'Email Send Test', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10103', 'zh_CN', '邮件发送测试', '邮件发送测试', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10104', 'en_GB', 'Query Preference', 'Query Preference', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10104', 'zh_CN', '查询首选项', '查询首选项', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10105', 'en_GB', 'Save Preference', 'Save Preference', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10105', 'zh_CN', '保存首选项', '保存首选项', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10106', 'en_GB', 'Query Profile', 'Query Profile', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10106', 'zh_CN', '查询配置', '查询配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10107', 'en_GB', 'Delete Profile', 'Delete Profile', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10107', 'zh_CN', '删除配置', '删除配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10108', 'en_GB', 'Update Profile', 'Update Profile', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10108', 'zh_CN', '更新配置', '更新配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10109', 'en_GB', 'Query Profile Value', 'Query Profile Value', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10109', 'zh_CN', '查询配置值', '查询配置值', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10110', 'en_GB', 'Query Profile Level Value', 'Query Profile Level Value', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10110', 'zh_CN', '查询指定级别的配置值', '查询指定级别的配置值', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10111', 'en_GB', 'Delete Profile Value', 'Delete Profile Value', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10111', 'zh_CN', '删除配置值', '删除配置值', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10112', 'en_GB', 'Query Prompt', 'Query Prompt', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10112', 'zh_CN', '查询描述', '查询描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10113', 'en_GB', 'Delete Prompt', 'Delete Prompt', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10113', 'zh_CN', '删除描述', '删除描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10114', 'en_GB', 'Update Prompt', 'Update Prompt', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10114', 'zh_CN', '更改描述', '更改描述', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10115', 'en_GB', 'Resource', 'Resource', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10115', 'zh_CN', '资源注册', '资源注册', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10116', 'en_GB', 'Update Personalization', 'Update Personalization', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10116', 'zh_CN', '更新个性化组件', '更新个性化组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10117', 'en_GB', 'Query Personalization', 'Query Personalization', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10117', 'zh_CN', '查询个性化组件', '查询个性化组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10118', 'en_GB', 'Delete Personalization', 'Delete Personalization', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10118', 'zh_CN', '删除个性化组件', '删除个性化组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10119', 'en_GB', 'Personalization', 'Personalization', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10119', 'zh_CN', '个性化组件', '个性化组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10120', 'en_GB', 'Resource Item', 'Resource Item', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10120', 'zh_CN', '资源组件', '资源组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10121', 'en_GB', 'Role Resource Item', 'Role Resource Item', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10121', 'zh_CN', '分配资源组件', '分配资源组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10122', 'en_GB', 'Query Resource', 'Query Resource', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10122', 'zh_CN', '查询资源', '查询资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10123', 'en_GB', 'Delete Resource', 'Delete Resource', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10123', 'zh_CN', '删除资源', '删除资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10124', 'en_GB', 'Update Resource', 'Update Resource', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10124', 'zh_CN', '更新资源', '更新资源', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10125', 'en_GB', 'Query Resource Item', 'Query Resource Item', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10125', 'zh_CN', '查询资源组件', '查询资源组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:27', '-1', '2017-03-27 15:25:27', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10126', 'en_GB', 'Delete Resource Item', 'Delete Resource Item', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10126', 'zh_CN', '删除资源组件', '删除资源组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10127', 'en_GB', 'Update Resoruce Item', 'Update Resource Item', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10127', 'zh_CN', '更新资源组件', '更新资源组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10128', 'en_GB', 'Select Role', 'Select role not present', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10128', 'zh_CN', '选择非当前角色', '选择非当前角色', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10129', 'en_GB', 'Function Assign', 'Function Assign', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10129', 'zh_CN', '功能分配', '功能分配', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10130', 'en_GB', 'Query Role Function', 'Query Role Function', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10130', 'zh_CN', '查询角色功能', '查询角色功能', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10131', 'en_GB', 'Query Function Resource Item', 'Query Function Resource Items', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10131', 'zh_CN', '查询功能资源组件', '查询功能资源组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10132', 'en_GB', 'Update Role Function', 'Update Role Function', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10132', 'zh_CN', '更新角色功能', '更新角色功能', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10133', 'en_GB', 'Update Function Resource Items', 'Update Function Resource Items', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10133', 'zh_CN', '更新功能资源组件', '更新资源组件', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10134', 'en_GB', 'Code', 'Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10134', 'zh_CN', '代码维护', '代码维护', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10135', 'en_GB', 'Edit Code', 'Edit Code', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10135', 'zh_CN', '编辑快码', '编辑快码', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10136', 'en_GB', 'System Config', 'System Config', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10136', 'zh_CN', '系统配置', '系统配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10137', 'en_GB', 'LOV', 'LOV', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10137', 'zh_CN', 'LOV维护', 'LOV维护', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10138', 'en_GB', 'Edit Lov', 'Edit Lov', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10138', 'zh_CN', '编辑 LOV', '编辑 LOV', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10139', 'en_GB', 'Lov Preview', 'Lov Preview', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10139', 'zh_CN', 'LOV 预览', 'LOV 预览', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10140', 'en_GB', 'MultiLanguage Editor', 'MultiLangauge Editor', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10140', 'zh_CN', '多语言编辑器', '多语言编辑器', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10141', 'en_GB', 'Profile', 'Profile', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10141', 'zh_CN', '配置维护', '配置维护', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10142', 'en_GB', 'Edit Profile', 'Edit Profile', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10142', 'zh_CN', '编辑配置文件', '编辑配置文件', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10143', 'en_GB', 'Prompt', 'Prompt', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10143', 'zh_CN', '描述维护', '描述维护', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10144', 'en_GB', 'Role', 'Role', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10144', 'zh_CN', '角色管理', '角色管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10145', 'en_GB', 'Delete Role', 'Delete Role', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10145', 'zh_CN', '角色删除', '角色删除', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10146', 'en_GB', 'Query Role', 'Query Role', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10146', 'zh_CN', '角色查询', '角色查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10147', 'en_GB', 'Update Role', 'Update Role', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10147', 'zh_CN', '角色更新', '角色更新', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10148', 'en_GB', 'User', 'User', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10148', 'zh_CN', '用户管理', '用户管理', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10149', 'en_GB', 'Role Assign', 'Role Assign', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10149', 'zh_CN', '角色分配', '角色分配', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10150', 'en_GB', 'Select Role', 'Role Select', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10150', 'zh_CN', '选择角色', '选择角色', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10151', 'en_GB', 'Query User', 'Query User', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10151', 'zh_CN', '用户查询', '用户查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10152', 'en_GB', 'Delete User', 'Delete User', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10152', 'zh_CN', '删除用户', '删除用户', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10153', 'en_GB', 'Update User', 'Update User', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10153', 'zh_CN', '更新用户', '更新用户', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10154', 'en_GB', 'Query User Role', 'Query User Role', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10154', 'zh_CN', '查询用户角色', '查询用户角色', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10155', 'en_GB', 'Update User Role', 'Update User Role', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10155', 'zh_CN', '保存用户角色', '保存用户角色', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10156', 'en_GB', 'Single User Info', 'Single User Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10156', 'zh_CN', '单条用户信息', '单条用户信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10157', 'en_GB', 'User email Check', 'User Email Check', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10157', 'zh_CN', '用户邮件检查', '用户邮件检查', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10158', 'en_GB', 'User Phone Check', 'User Phone Check', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10158', 'zh_CN', '电话号码检查', '电话号码检查', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10159', 'en_GB', 'User Exists check', 'User Exists check', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10159', 'zh_CN', '用户是否存在', '用户是否存在', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10160', 'en_GB', 'Query User Info', 'Query User Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10160', 'zh_CN', '用户信息查询', '用户信息查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10161', 'en_GB', 'Login Success', 'Login Success', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10161', 'zh_CN', '登录成功', '登录成功', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10162', 'en_GB', 'Update Password', 'Update Password', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10162', 'zh_CN', '更改密码', '更改密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10163', 'en_GB', 'User Info', 'User Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10163', 'zh_CN', '用户信息', '用户信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10164', 'en_GB', 'Update Password', 'Update Password', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10164', 'zh_CN', '更改密码', '更改密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10165', 'en_GB', 'Update User Info', 'Update User Info', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10165', 'zh_CN', '更新个人信息', '更新个人信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10166', 'en_GB', 'Icon Select', 'Icon Select', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10166', 'zh_CN', '图标选择', '图标选择', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10167', 'en_GB', 'Timeout', 'Timeout', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10167', 'zh_CN', '超时', '超时', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10168', 'en_GB', 'Captcha Service', 'Captcha Service', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10168', 'zh_CN', '验证码服务', '验证码服务', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10169', 'en_GB', 'company', 'company', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10169', 'zh_CN', '公司维护', '公司信息维护', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10170', 'en_GB', 'company info update', 'company info update', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10170', 'zh_CN', '公司信息修改', '公司信息修改', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10171', 'en_GB', 'company info query', 'company info query', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10171', 'zh_CN', '公司信息查询', '公司信息查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10172', 'en_GB', 'company info delete', 'company info delete', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10172', 'zh_CN', '公司信息删除', '公司信息删除', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10173', 'en_GB', 'company edit page', 'company edit page', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10173', 'zh_CN', '公司编辑界面', '公司编辑界面', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10174', 'en_GB', 'Dashboard Config Page', 'Dashboard Config Page', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10174', 'zh_CN', '仪表盘配置界面', '仪表盘配置', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10175', 'en_GB', 'Query dashboard info', 'Query dashboard info', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10175', 'zh_CN', '查询仪表盘', '查询仪表盘', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10176', 'en_GB', 'Update dashboard info', 'Update dashboard info', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10176', 'zh_CN', '更新仪表盘', '更新仪表盘', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10177', 'en_GB', 'Delete dashboard info', 'Delete dashboard info', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10177', 'zh_CN', '删除仪表盘', '删除仪表盘', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10178', 'en_GB', 'User Task', 'User Task', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10178', 'zh_CN', '代办事项', '代办事项', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10179', 'en_GB', 'system JVM metrics', 'system JVM metrics', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10179', 'zh_CN', '系统JVM指标', '系统JVM指标', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10180', 'en_GB', 'mail status search', 'mail status search', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10180', 'zh_CN', '邮件状态查询', '邮件状态查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10181', 'en_GB', 'Interface invoke records', 'Interface invoke records', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10181', 'zh_CN', '接口调用记录', '接口调用记录', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10182', 'en_GB', 'The interface definition interface', 'The interface definition interface', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10182', 'zh_CN', '接口定义界面', '接口定义界面', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10183', 'en_GB', 'Interface system information', 'Interface system information', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10183', 'zh_CN', '接口系统信息', '接口系统信息', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10184', 'en_GB', 'Interface to modify the page', 'Interface to modify the page', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10184', 'zh_CN', '接口修改页面', '接口修改页面', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10185', 'en_GB', 'System index page for details', 'System index page for details', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10185', 'zh_CN', '系统指标详情页', '系统指标详情页', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10186', 'en_GB', 'Email Status', 'Email Status', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10186', 'zh_CN', '邮件状态查询', '邮件状态查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10187', 'en_GB', 'Email Error', 'Email Error', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10187', 'zh_CN', '邮件错误信息查询', '邮件错误信息查询', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10188', 'en_GB', 'Admin Reset Password', 'Admin Reset Password', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10188', 'zh_CN', '管理员修改用户密码', '管理员修改用户密码', '1', '-1', '-1', '-1', '2017-03-27 15:25:28', '-1', '2017-03-27 15:25:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10195', 'en_GB', 'testUserPage', 'testUserPage', '1', '-1', '-1', '10001', '2017-03-31 19:53:05', '10001', '2017-03-31 19:53:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10195', 'zh_CN', '测试用户页面', '测试用户页面', '1', '-1', '-1', '10001', '2017-03-31 19:53:05', '10001', '2017-03-31 19:53:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10196', 'en_GB', 'testGoodsPage', 'testGoodsPage', '1', '-1', '-1', '10001', '2017-03-31 19:54:13', '10001', '2017-03-31 19:54:13', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10196', 'zh_CN', '测试商品页面', '测试商品页面', '1', '-1', '-1', '10001', '2017-03-31 19:54:13', '10001', '2017-03-31 19:54:13', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10197', 'en_GB', 'selectUser', 'selectUser', '1', '-1', '-1', '10001', '2017-03-31 19:55:21', '10001', '2017-03-31 19:55:51', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10197', 'zh_CN', '查询用户', '查询用户', '1', '-1', '-1', '10001', '2017-03-31 19:55:21', '10001', '2017-03-31 19:55:51', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10198', 'en_GB', 'testUserGoodsPage', 'testUserGoodsPag', '1', '-1', '-1', '10001', '2017-03-31 19:56:55', '10001', '2017-03-31 19:56:55', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10198', 'zh_CN', '测试用户商品页面', '测试用户商品页面', '1', '-1', '-1', '10001', '2017-03-31 19:56:55', '10001', '2017-03-31 19:56:55', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10200', 'en_GB', 'saleDetailsPages', 'saleDetailsPages', '1', '-1', '-1', '10001', '2017-04-01 10:17:42', '10001', '2017-04-01 10:17:42', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10200', 'zh_CN', '销售明细页面', '销售明细页面', '1', '-1', '-1', '10001', '2017-04-01 10:17:42', '10001', '2017-04-01 10:17:42', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10201', 'en_GB', 'selectOrderSum', 'selectOrderSum', '1', '-1', '-1', '10001', '2017-04-03 09:40:25', '10001', '2017-04-03 09:40:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10201', 'zh_CN', '查询订单汇总', '查询订单汇总', '1', '-1', '-1', '10001', '2017-04-03 09:40:25', '10001', '2017-04-03 12:51:20', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10202', 'en_GB', 'orderDetailPages', 'orderDetailPages', '1', '-1', '-1', '10001', '2017-04-03 15:54:02', '10001', '2017-04-03 15:54:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10202', 'zh_CN', '订单明细页面', '订单明细页面', '1', '-1', '-1', '10001', '2017-04-03 15:54:02', '10001', '2017-04-03 15:54:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10203', 'en_GB', '2', '2', '1', '-1', '-1', '10001', '2017-04-04 13:01:13', '10001', '2017-04-04 13:01:13', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10203', 'zh_CN', '2', '2', '1', '-1', '-1', '10001', '2017-04-04 13:01:13', '10001', '2017-04-04 13:01:13', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10204', 'en_GB', '123', '123', '1', '-1', '-1', '10001', '2017-04-05 13:10:02', '10001', '2017-04-05 13:10:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10204', 'zh_CN', '123', '123', '1', '-1', '-1', '10001', '2017-04-05 13:10:02', '10001', '2017-04-05 14:32:32', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10205', 'en_GB', 'transactionType', 'transactionType', '1', '-1', '-1', '10001', '2017-04-19 18:06:36', '10001', '2017-04-19 18:06:36', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10205', 'zh_CN', '事务类型', '事务类型', '1', '-1', '-1', '10001', '2017-04-19 18:06:36', '10001', '2017-04-19 18:29:52', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10206', 'en_GB', 'interfaceSet', 'interfaceSet', '1', '-1', '-1', '10001', '2017-04-19 18:40:45', '10001', '2017-04-19 18:40:45', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10206', 'zh_CN', '接口设置界面', '接口设置界面', '1', '-1', '-1', '10001', '2017-04-19 18:40:45', '10001', '2017-04-19 18:42:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10207', 'en_GB', 'transctionType', 'transctionType', '1', '-1', '-1', '10001', '2017-04-21 11:31:56', '10001', '2017-04-21 11:31:56', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10207', 'zh_CN', '事务类型界面', '事务类型', '1', '-1', '-1', '10001', '2017-04-21 11:31:56', '10001', '2017-04-21 11:36:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10208', 'en_GB', 'interface', 'interface', '1', '-1', '-1', '10001', '2017-04-21 11:33:17', '10001', '2017-04-21 11:33:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10208', 'zh_CN', '通用接口页面', '通用接口页面', '1', '-1', '-1', '10001', '2017-04-21 11:33:17', '10001', '2017-04-21 11:35:54', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10210', 'en_GB', 'interfaceNews', 'interfaceNews', '1', '-1', '-1', '10001', '2017-04-21 12:01:02', '10001', '2017-04-21 12:01:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10210', 'zh_CN', '接口新建界面', '接口新建界面', '1', '-1', '-1', '10001', '2017-04-21 12:01:02', '10001', '2017-05-17 16:51:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10211', 'en_GB', 'detail', 'detail', '1', '-1', '-1', '10001', '2017-04-21 21:13:18', '10001', '2017-04-21 21:13:18', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10211', 'zh_CN', '细节页面', '细节页面', '1', '-1', '-1', '10001', '2017-04-21 21:13:18', '10001', '2017-04-21 21:13:18', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10212', 'en_GB', '123', null, '1', '-1', '-1', '10001', '2017-06-17 10:35:41', '10001', '2017-06-17 10:35:41', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10212', 'zh_CN', '123', null, '1', '-1', '-1', '10001', '2017-06-17 10:35:41', '10001', '2017-06-17 10:35:41', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10213', 'en_GB', '234', null, '1', '-1', '-1', '10001', '2017-06-17 10:36:11', '10001', '2017-06-17 10:36:11', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10213', 'zh_CN', '234', null, '1', '-1', '-1', '10001', '2017-06-17 10:36:11', '10001', '2017-06-17 10:36:11', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10214', 'en_GB', '6', null, '1', '-1', '-1', '10001', '2017-06-17 10:39:36', '10001', '2017-06-17 10:39:36', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10214', 'zh_CN', '6', null, '1', '-1', '-1', '10001', '2017-06-17 10:39:36', '10001', '2017-06-17 10:39:36', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10215', 'en_GB', '8', null, '1', '-1', '-1', '10001', '2017-06-17 13:31:25', '10001', '2017-06-17 13:31:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10215', 'zh_CN', '8', null, '1', '-1', '-1', '10001', '2017-06-17 13:31:25', '10001', '2017-06-17 16:10:34', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10216', 'en_GB', '9', null, '1', '-1', '-1', '10001', '2017-06-17 13:31:48', '10001', '2017-06-17 13:31:48', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10216', 'zh_CN', '9', null, '1', '-1', '-1', '10001', '2017-06-17 13:31:48', '10001', '2017-06-17 13:31:48', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10217', 'en_GB', '111', null, '1', '-1', '-1', '10001', '2017-06-17 13:56:04', '10001', '2017-06-17 13:56:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10217', 'zh_CN', '111', null, '1', '-1', '-1', '10001', '2017-06-17 13:56:04', '10001', '2017-06-17 17:05:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10218', 'en_GB', 'u', null, '1', '-1', '-1', '10001', '2017-06-17 13:58:31', '10001', '2017-06-17 13:58:31', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10218', 'zh_CN', 'u', null, '1', '-1', '-1', '10001', '2017-06-17 13:58:31', '10001', '2017-06-17 17:05:28', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10219', 'en_GB', 'chaxun', null, '1', '-1', '-1', '10001', '2017-06-17 16:13:14', '10001', '2017-06-17 16:13:14', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10219', 'zh_CN', 'chaxun', null, '1', '-1', '-1', '10001', '2017-06-17 16:13:14', '10001', '2017-06-17 16:13:14', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10220', 'en_GB', '接口行', null, '1', '-1', '-1', '10001', '2017-06-18 10:21:06', '10001', '2017-06-18 10:21:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10220', 'zh_CN', '接口行', null, '1', '-1', '-1', '10001', '2017-06-18 10:21:06', '10001', '2017-06-18 10:21:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_b`;
CREATE TABLE `sys_role_b` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_CODE` varchar(40) NOT NULL COMMENT '角色编码',
  `ROLE_NAME` varchar(150) NOT NULL COMMENT '角色名称',
  `ROLE_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '角色描述',
  `START_ACTIVE_DATE` date DEFAULT NULL COMMENT '开始生效日期',
  `END_ACTIVE_DATE` date DEFAULT NULL COMMENT '截至生效日期',
  `ENABLE_FLAG` varchar(1) DEFAULT 'Y' COMMENT '启用标记',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `SYS_ROLE_B_U1` (`ROLE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_b
-- ----------------------------
INSERT INTO `sys_role_b` VALUES ('10001', 'ADMIN', '管理员', '系统管理员', '2016-06-15', null, 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:25', '-1', '2017-03-27 15:25:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_b` VALUES ('10002', 'EMPLOYEE', '员工', '员工', null, '2020-12-31', 'Y', '1', '-1', '-1', '-1', '2017-03-27 15:25:25', '-1', '2017-03-27 15:25:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_function`;
CREATE TABLE `sys_role_function` (
  `SRF_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '功能ID',
  `FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '功能ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`SRF_ID`),
  UNIQUE KEY `SYS_ROLE_FUNCTION_U1` (`ROLE_ID`,`FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13068 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_function
-- ----------------------------
INSERT INTO `sys_role_function` VALUES ('10038', '10002', '10003', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10039', '10002', '10022', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10040', '10002', '10023', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10041', '10002', '10024', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10042', '10002', '10025', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10043', '10002', '10015', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10044', '10002', '10016', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10045', '10002', '10017', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10046', '10002', '10004', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10047', '10002', '10006', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10048', '10002', '10002', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10049', '10002', '10027', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10050', '10002', '10029', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10051', '10002', '10031', '1', '-1', '-1', '-1', '2017-03-27 15:25:29', '-1', '2017-03-27 15:25:29', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13022', '10001', '10033', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13023', '10001', '10034', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13024', '10001', '10036', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13025', '10001', '10035', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13026', '10001', '10037', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13027', '10001', '10066', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13028', '10001', '10067', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13029', '10001', '10068', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13030', '10001', '10018', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13031', '10001', '10021', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13032', '10001', '10019', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13033', '10001', '10020', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13034', '10001', '10015', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13035', '10001', '10016', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13036', '10001', '10017', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13037', '10001', '10026', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13038', '10001', '10027', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13039', '10001', '10031', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13040', '10001', '10028', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13041', '10001', '10029', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13042', '10001', '10030', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13043', '10001', '10032', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13044', '10001', '10040', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13045', '10001', '10041', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13046', '10001', '10042', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13047', '10001', '10001', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13048', '10001', '10007', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13049', '10001', '10011', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13050', '10001', '10012', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13051', '10001', '10013', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13052', '10001', '10014', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13053', '10001', '10043', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13054', '10001', '10008', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13055', '10001', '10009', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13056', '10001', '10010', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13057', '10001', '10038', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13058', '10001', '10002', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13059', '10001', '10003', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13060', '10001', '10004', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13061', '10001', '10005', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13062', '10001', '10006', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13063', '10001', '10022', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13064', '10001', '10023', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13065', '10001', '10024', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13066', '10001', '10025', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('13067', '10001', '10039', '1', '-1', '-1', '10001', '2017-06-17 17:17:51', '10001', '2017-06-17 17:17:51', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_resource_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource_item`;
CREATE TABLE `sys_role_resource_item` (
  `RSI_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `RESOURCE_ITEM_ID` bigint(20) DEFAULT NULL COMMENT '功能控件ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RSI_ID`),
  UNIQUE KEY `SYS_ROLE_RESOURCE_ITEM_U1` (`ROLE_ID`,`RESOURCE_ITEM_ID`),
  KEY `SYS_ROLE_RESOURCE_ITEM_N1` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource_item
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_tl`;
CREATE TABLE `sys_role_tl` (
  `ROLE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `ROLE_NAME` varchar(150) DEFAULT NULL COMMENT '角色名称',
  `ROLE_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '角色描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_tl
-- ----------------------------
INSERT INTO `sys_role_tl` VALUES ('10001', 'en_GB', 'ADMIN', 'Administrator', '1', '-1', '-1', '-1', '2017-03-27 15:25:25', '-1', '2017-03-27 15:25:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_tl` VALUES ('10001', 'zh_CN', '管理员', '系统管理员', '1', '-1', '-1', '-1', '2017-03-27 15:25:25', '-1', '2017-03-27 15:25:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_tl` VALUES ('10002', 'en_GB', 'Employee', 'Employee', '1', '-1', '-1', '-1', '2017-03-27 15:25:25', '-1', '2017-03-27 15:25:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_tl` VALUES ('10002', 'zh_CN', '员工', '员工', '1', '-1', '-1', '-1', '2017-03-27 15:25:25', '-1', '2017-03-27 15:25:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_TYPE` varchar(30) DEFAULT NULL COMMENT '用户类型',
  `USER_NAME` varchar(40) NOT NULL COMMENT '用户名',
  `PASSWORD_ENCRYPTED` varchar(80) DEFAULT NULL COMMENT '加密过的密码',
  `EMAIL` varchar(150) DEFAULT NULL COMMENT '邮箱地址',
  `PHONE` varchar(40) DEFAULT NULL COMMENT '电话号码',
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '有效期从',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '有效期至',
  `STATUS` varchar(30) DEFAULT NULL COMMENT '状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `LAST_LOGIN_DATE` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `LAST_PASSWORD_UPDATE_DATE` datetime DEFAULT NULL COMMENT '最后一次修改密码时间',
  `FIRST_LOGIN` varchar(1) DEFAULT 'Y' COMMENT '是否第一次登录',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `SYS_USER_U1` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('10001', null, 'ADMIN', '59baed859597b69548f28654af4125736915ea870252f8db664e3187dcfc298ead2b761e2acb576a', 'hap_dev@126.com', '13763784776', '2016-01-01 00:00:00', null, 'ACTV', '1', '-1', '-1', '-1', '2017-03-27 15:25:25', '-1', '2017-03-27 15:25:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Y');
INSERT INTO `sys_user` VALUES ('10002', null, 'JESSEN', '6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2', 'shengyang.zhou@hand-china.com', '13764784776', null, null, 'ACTV', '1', '-1', '-1', '-1', '2017-03-27 15:25:25', '-1', '2017-03-27 15:25:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Y');
INSERT INTO `sys_user` VALUES ('10003', null, 'HAILEN', '6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2', 'hailen.hap@126.com', '186', null, null, 'ACTV', '1', '-1', '-1', '-1', '2017-03-27 15:25:25', '-1', '2017-03-27 15:25:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Y');
INSERT INTO `sys_user` VALUES ('10004', null, 'ERIC', '6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2', 'eric.hap@126.com', '1893', null, null, 'ACTV', '1', '-1', '-1', '-1', '2017-03-27 15:25:25', '-1', '2017-03-27 15:25:25', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Y');
INSERT INTO `sys_user` VALUES ('10005', null, 'TONY', '6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2', 'tony.hap@126.com', '1891', null, null, 'ACTV', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Y');
INSERT INTO `sys_user` VALUES ('10006', null, 'RODGERS', '6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2', 'Rodgers.hap@126.com', '1892', null, null, 'ACTV', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Y');

-- ----------------------------
-- Table structure for sys_user_dashboard
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dashboard`;
CREATE TABLE `sys_user_dashboard` (
  `USER_DASHBOARD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `DASHBOARD_ID` bigint(20) NOT NULL COMMENT '仪表盘ID',
  `DASHBOARD_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '仪表盘排序号',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_DASHBOARD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_dashboard
-- ----------------------------
INSERT INTO `sys_user_dashboard` VALUES ('10001', '10001', '10001', '1', '3', '-1', '-1', '-1', '2017-03-27 15:25:30', '10001', '2017-04-04 21:36:52', '10001');
INSERT INTO `sys_user_dashboard` VALUES ('10002', '10001', '10002', '2', '3', '-1', '-1', '-1', '2017-03-27 15:25:30', '10001', '2017-04-04 21:36:52', '10001');
INSERT INTO `sys_user_dashboard` VALUES ('10003', '10001', '10003', '3', '3', '-1', '-1', '-1', '2017-03-27 15:25:30', '10001', '2017-04-04 21:36:52', '10001');

-- ----------------------------
-- Table structure for sys_user_demo_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_demo_b`;
CREATE TABLE `sys_user_demo_b` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_CODE` varchar(255) NOT NULL COMMENT '编码',
  `USER_NAME` varchar(255) NOT NULL COMMENT '姓名',
  `USER_AGE` bigint(20) DEFAULT NULL COMMENT '年龄',
  `USER_SEX` varchar(50) DEFAULT NULL COMMENT '性别',
  `USER_BIRTH` date DEFAULT NULL COMMENT '生日',
  `USER_EMAIL` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `USER_PHONE` bigint(20) DEFAULT NULL COMMENT '电话',
  `ENABLE_FLAG` varchar(1) DEFAULT NULL COMMENT '是否启用',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `ROLE_NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `START_ACTIVE_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_ACTIVE_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `SYS_USER_DEMO_B_U1` (`USER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_demo_b
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_demo_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_demo_tl`;
CREATE TABLE `sys_user_demo_tl` (
  `USER_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_demo_tl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login`;
CREATE TABLE `sys_user_login` (
  `login_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(40) DEFAULT NULL COMMENT 'ip地址',
  `referer` varchar(240) DEFAULT NULL,
  `user_agent` varchar(240) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_login
-- ----------------------------
INSERT INTO `sys_user_login` VALUES ('1', '10001', '2017-03-28 13:09:13', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-28 13:09:13', '-1', '2017-03-28 13:09:13', '-1');
INSERT INTO `sys_user_login` VALUES ('2', '10001', '2017-03-29 09:09:52', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-29 09:09:51', '-1', '2017-03-29 09:09:51', '-1');
INSERT INTO `sys_user_login` VALUES ('3', '10001', '2017-03-29 14:05:00', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-29 14:05:00', '-1', '2017-03-29 14:05:00', '-1');
INSERT INTO `sys_user_login` VALUES ('4', '10001', '2017-03-29 14:24:12', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-29 14:24:12', '-1', '2017-03-29 14:24:12', '-1');
INSERT INTO `sys_user_login` VALUES ('5', '10001', '2017-03-29 15:52:34', '192.168.50.67', 'http://localhost:8080/hap/login?logout', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-29 15:52:33', '-1', '2017-03-29 15:52:33', '-1');
INSERT INTO `sys_user_login` VALUES ('6', '10001', '2017-03-30 09:21:11', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-30 09:21:11', '-1', '2017-03-30 09:21:11', '-1');
INSERT INTO `sys_user_login` VALUES ('7', '10001', '2017-03-30 19:54:35', '192.168.0.107', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-30 19:54:35', '-1', '2017-03-30 19:54:35', '-1');
INSERT INTO `sys_user_login` VALUES ('8', '10001', '2017-03-30 22:02:50', '192.168.0.107', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-30 22:02:50', '-1', '2017-03-30 22:02:50', '-1');
INSERT INTO `sys_user_login` VALUES ('9', '10001', '2017-03-30 22:40:45', '192.168.0.107', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-30 22:40:45', '-1', '2017-03-30 22:40:45', '-1');
INSERT INTO `sys_user_login` VALUES ('10', '10001', '2017-03-31 11:11:38', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-31 11:11:38', '-1', '2017-03-31 11:11:38', '-1');
INSERT INTO `sys_user_login` VALUES ('11', '10001', '2017-03-31 14:02:11', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-31 14:02:10', '-1', '2017-03-31 14:02:10', '-1');
INSERT INTO `sys_user_login` VALUES ('12', '10001', '2017-03-31 19:48:02', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-31 19:48:01', '-1', '2017-03-31 19:48:01', '-1');
INSERT INTO `sys_user_login` VALUES ('13', '10001', '2017-03-31 21:36:06', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-03-31 21:36:06', '-1', '2017-03-31 21:36:06', '-1');
INSERT INTO `sys_user_login` VALUES ('14', '10001', '2017-04-01 08:42:50', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-01 08:42:50', '-1', '2017-04-01 08:42:50', '-1');
INSERT INTO `sys_user_login` VALUES ('15', '10001', '2017-04-01 20:27:43', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-01 20:27:42', '-1', '2017-04-01 20:27:42', '-1');
INSERT INTO `sys_user_login` VALUES ('16', '10001', '2017-04-02 11:51:04', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-02 11:51:04', '-1', '2017-04-02 11:51:04', '-1');
INSERT INTO `sys_user_login` VALUES ('17', '10001', '2017-04-02 18:41:49', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-02 18:41:48', '-1', '2017-04-02 18:41:48', '-1');
INSERT INTO `sys_user_login` VALUES ('18', '10001', '2017-04-02 20:01:11', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-02 20:01:10', '-1', '2017-04-02 20:01:10', '-1');
INSERT INTO `sys_user_login` VALUES ('19', '10001', '2017-04-03 08:45:23', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-03 08:45:23', '-1', '2017-04-03 08:45:23', '-1');
INSERT INTO `sys_user_login` VALUES ('20', '10001', '2017-04-04 08:50:38', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-04 08:50:38', '-1', '2017-04-04 08:50:38', '-1');
INSERT INTO `sys_user_login` VALUES ('21', '10001', '2017-04-04 11:13:37', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-04 11:13:36', '-1', '2017-04-04 11:13:36', '-1');
INSERT INTO `sys_user_login` VALUES ('22', '10001', '2017-04-04 12:06:33', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-04 12:06:33', '-1', '2017-04-04 12:06:33', '-1');
INSERT INTO `sys_user_login` VALUES ('23', '10001', '2017-04-04 14:54:12', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-04 14:54:11', '-1', '2017-04-04 14:54:11', '-1');
INSERT INTO `sys_user_login` VALUES ('24', '10001', '2017-04-04 18:17:53', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-04 18:17:53', '-1', '2017-04-04 18:17:53', '-1');
INSERT INTO `sys_user_login` VALUES ('25', '10001', '2017-04-05 09:14:15', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-05 09:14:14', '-1', '2017-04-05 09:14:14', '-1');
INSERT INTO `sys_user_login` VALUES ('26', '10001', '2017-04-05 12:50:29', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-05 12:50:28', '-1', '2017-04-05 12:50:28', '-1');
INSERT INTO `sys_user_login` VALUES ('27', '10001', '2017-04-05 14:44:56', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-05 14:44:55', '-1', '2017-04-05 14:44:55', '-1');
INSERT INTO `sys_user_login` VALUES ('28', '10001', '2017-04-05 15:21:48', '192.168.50.67', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-05 15:21:47', '-1', '2017-04-05 15:21:47', '-1');
INSERT INTO `sys_user_login` VALUES ('29', '10001', '2017-04-06 10:12:24', '192.168.50.58', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-06 10:12:24', '-1', '2017-04-06 10:12:24', '-1');
INSERT INTO `sys_user_login` VALUES ('30', '10001', '2017-04-06 11:05:19', '192.168.50.58', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-06 11:05:19', '-1', '2017-04-06 11:05:19', '-1');
INSERT INTO `sys_user_login` VALUES ('31', '10001', '2017-04-06 11:15:01', '192.168.50.58', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-06 11:15:01', '-1', '2017-04-06 11:15:01', '-1');
INSERT INTO `sys_user_login` VALUES ('32', '10001', '2017-04-06 11:17:41', '192.168.50.58', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-06 11:17:40', '-1', '2017-04-06 11:17:40', '-1');
INSERT INTO `sys_user_login` VALUES ('33', '10001', '2017-04-06 13:40:09', '192.168.50.58', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-06 13:40:08', '-1', '2017-04-06 13:40:08', '-1');
INSERT INTO `sys_user_login` VALUES ('34', '10001', '2017-04-06 16:58:31', '192.168.50.58', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-06 16:58:31', '-1', '2017-04-06 16:58:31', '-1');
INSERT INTO `sys_user_login` VALUES ('35', '10001', '2017-04-07 09:07:35', '192.168.50.58', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-07 09:07:34', '-1', '2017-04-07 09:07:34', '-1');
INSERT INTO `sys_user_login` VALUES ('36', '10001', '2017-04-09 21:53:14', '192.168.0.116', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-09 21:53:14', '-1', '2017-04-09 21:53:14', '-1');
INSERT INTO `sys_user_login` VALUES ('37', '10001', '2017-04-10 09:16:40', '192.168.50.40', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-10 09:16:39', '-1', '2017-04-10 09:16:39', '-1');
INSERT INTO `sys_user_login` VALUES ('38', '10001', '2017-04-10 14:57:41', '192.168.50.40', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-10 14:57:40', '-1', '2017-04-10 14:57:40', '-1');
INSERT INTO `sys_user_login` VALUES ('39', '10001', '2017-04-10 14:58:30', '192.168.50.40', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-10 14:58:29', '-1', '2017-04-10 14:58:29', '-1');
INSERT INTO `sys_user_login` VALUES ('40', '10001', '2017-04-10 14:59:00', '192.168.50.40', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '1', '-1', '-1', '-1', '2017-04-10 14:59:00', '-1', '2017-04-10 14:59:00', '-1');
INSERT INTO `sys_user_login` VALUES ('41', '10001', '2017-04-10 17:04:11', '192.168.50.40', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-10 17:04:10', '-1', '2017-04-10 17:04:10', '-1');
INSERT INTO `sys_user_login` VALUES ('42', '10001', '2017-04-18 13:14:55', '192.168.191.3', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-18 13:14:55', '-1', '2017-04-18 13:14:55', '-1');
INSERT INTO `sys_user_login` VALUES ('43', '10001', '2017-04-19 16:14:50', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-19 16:14:49', '-1', '2017-04-19 16:14:49', '-1');
INSERT INTO `sys_user_login` VALUES ('44', '10001', '2017-04-19 16:28:10', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-19 16:28:09', '-1', '2017-04-19 16:28:09', '-1');
INSERT INTO `sys_user_login` VALUES ('45', '10001', '2017-04-19 22:35:47', '192.168.227.219', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-19 22:35:47', '-1', '2017-04-19 22:35:47', '-1');
INSERT INTO `sys_user_login` VALUES ('46', '10001', '2017-04-19 22:41:51', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-19 22:41:50', '-1', '2017-04-19 22:41:50', '-1');
INSERT INTO `sys_user_login` VALUES ('47', '10001', '2017-04-21 11:26:35', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-21 11:26:35', '-1', '2017-04-21 11:26:35', '-1');
INSERT INTO `sys_user_login` VALUES ('48', '10001', '2017-04-21 20:58:34', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-21 20:58:34', '-1', '2017-04-21 20:58:34', '-1');
INSERT INTO `sys_user_login` VALUES ('49', '10001', '2017-04-22 10:21:07', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-22 10:21:07', '-1', '2017-04-22 10:21:07', '-1');
INSERT INTO `sys_user_login` VALUES ('50', '10001', '2017-04-23 12:34:45', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-23 12:34:44', '-1', '2017-04-23 12:34:44', '-1');
INSERT INTO `sys_user_login` VALUES ('51', '10001', '2017-04-25 10:17:59', '127.0.0.1', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-25 10:17:58', '-1', '2017-04-25 10:17:58', '-1');
INSERT INTO `sys_user_login` VALUES ('52', '10001', '2017-04-29 14:17:40', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-04-29 14:17:40', '-1', '2017-04-29 14:17:40', '-1');
INSERT INTO `sys_user_login` VALUES ('53', '10001', '2017-05-03 11:52:50', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-03 11:52:50', '-1', '2017-05-03 11:52:50', '-1');
INSERT INTO `sys_user_login` VALUES ('54', '10001', '2017-05-04 11:54:52', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-04 11:54:52', '-1', '2017-05-04 11:54:52', '-1');
INSERT INTO `sys_user_login` VALUES ('55', '10001', '2017-05-07 15:45:45', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-07 15:45:44', '-1', '2017-05-07 15:45:44', '-1');
INSERT INTO `sys_user_login` VALUES ('56', '10001', '2017-05-14 11:09:26', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-14 11:09:25', '-1', '2017-05-14 11:09:25', '-1');
INSERT INTO `sys_user_login` VALUES ('57', '10001', '2017-05-14 13:42:05', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-14 13:42:04', '-1', '2017-05-14 13:42:04', '-1');
INSERT INTO `sys_user_login` VALUES ('58', '10001', '2017-05-14 22:47:07', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-14 22:47:06', '-1', '2017-05-14 22:47:06', '-1');
INSERT INTO `sys_user_login` VALUES ('59', '10001', '2017-05-15 08:33:08', '10.2.14.9', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-15 08:33:08', '-1', '2017-05-15 08:33:08', '-1');
INSERT INTO `sys_user_login` VALUES ('60', '10001', '2017-05-17 16:16:01', '10.2.15.43', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-17 16:16:00', '-1', '2017-05-17 16:16:00', '-1');
INSERT INTO `sys_user_login` VALUES ('61', '10001', '2017-05-17 19:48:18', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-17 19:48:17', '-1', '2017-05-17 19:48:17', '-1');
INSERT INTO `sys_user_login` VALUES ('62', '10001', '2017-05-17 22:46:40', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-17 22:46:39', '-1', '2017-05-17 22:46:39', '-1');
INSERT INTO `sys_user_login` VALUES ('63', '10001', '2017-05-20 16:44:52', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-20 16:44:51', '-1', '2017-05-20 16:44:51', '-1');
INSERT INTO `sys_user_login` VALUES ('64', '10001', '2017-05-21 15:07:41', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-21 15:07:40', '-1', '2017-05-21 15:07:40', '-1');
INSERT INTO `sys_user_login` VALUES ('65', '10001', '2017-05-21 15:20:36', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-05-21 15:20:35', '-1', '2017-05-21 15:20:35', '-1');
INSERT INTO `sys_user_login` VALUES ('66', '10001', '2017-06-14 14:35:30', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-14 14:35:30', '-1', '2017-06-14 14:35:30', '-1');
INSERT INTO `sys_user_login` VALUES ('67', '10001', '2017-06-14 20:17:39', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-14 20:17:39', '-1', '2017-06-14 20:17:39', '-1');
INSERT INTO `sys_user_login` VALUES ('68', '10001', '2017-06-15 14:22:34', '192.168.227.219', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-15 14:22:34', '-1', '2017-06-15 14:22:34', '-1');
INSERT INTO `sys_user_login` VALUES ('69', '10001', '2017-06-15 14:35:15', '192.168.227.219', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-15 14:35:14', '-1', '2017-06-15 14:35:14', '-1');
INSERT INTO `sys_user_login` VALUES ('70', '10001', '2017-06-15 14:54:58', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-15 14:54:58', '-1', '2017-06-15 14:54:58', '-1');
INSERT INTO `sys_user_login` VALUES ('71', '10001', '2017-06-16 13:24:50', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-16 13:24:49', '-1', '2017-06-16 13:24:49', '-1');
INSERT INTO `sys_user_login` VALUES ('72', '10001', '2017-06-16 18:59:11', '192.168.227.219', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-16 18:59:10', '-1', '2017-06-16 18:59:10', '-1');
INSERT INTO `sys_user_login` VALUES ('73', '10001', '2017-06-17 10:34:34', '127.0.0.1', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-17 10:34:34', '-1', '2017-06-17 10:34:34', '-1');
INSERT INTO `sys_user_login` VALUES ('74', '10001', '2017-06-17 11:27:41', '127.0.0.1', 'http://localhost:8080/core/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-17 11:27:40', '-1', '2017-06-17 11:27:40', '-1');
INSERT INTO `sys_user_login` VALUES ('75', '10001', '2017-06-17 13:30:07', '192.168.43.118', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-17 13:30:07', '-1', '2017-06-17 13:30:07', '-1');
INSERT INTO `sys_user_login` VALUES ('76', '10001', '2017-06-17 13:34:25', '192.168.43.118', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-17 13:34:25', '-1', '2017-06-17 13:34:25', '-1');
INSERT INTO `sys_user_login` VALUES ('77', '10001', '2017-06-17 13:43:09', '192.168.43.118', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-17 13:43:08', '-1', '2017-06-17 13:43:08', '-1');
INSERT INTO `sys_user_login` VALUES ('78', '10001', '2017-06-17 13:44:56', '192.168.43.118', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '1', '-1', '-1', '-1', '2017-06-17 13:44:56', '-1', '2017-06-17 13:44:56', '-1');
INSERT INTO `sys_user_login` VALUES ('79', '10001', '2017-06-17 14:31:55', '192.168.43.118', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-17 14:31:54', '-1', '2017-06-17 14:31:54', '-1');
INSERT INTO `sys_user_login` VALUES ('80', '10001', '2017-06-17 16:02:36', '127.0.0.1', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-17 16:02:35', '-1', '2017-06-17 16:02:35', '-1');
INSERT INTO `sys_user_login` VALUES ('81', '10001', '2017-06-18 09:58:39', '192.168.227.219', 'http://localhost:8080/hap/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '-1', '-1', '-1', '2017-06-18 09:58:38', '-1', '2017-06-18 09:58:38', '-1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `SUR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`SUR_ID`),
  UNIQUE KEY `SYS_USER_ROLE_U1` (`ROLE_ID`,`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('10001', '10001', '10001', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10002', '10001', '10002', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10003', '10002', '10002', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10004', '10003', '10002', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10005', '10004', '10002', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10006', '10005', '10002', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10007', '10006', '10002', '1', '-1', '-1', '-1', '2017-03-27 15:25:26', '-1', '2017-03-27 15:25:26', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for test_fruit_b
-- ----------------------------
DROP TABLE IF EXISTS `test_fruit_b`;
CREATE TABLE `test_fruit_b` (
  `fruit_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fruit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_fruit_b
-- ----------------------------
INSERT INTO `test_fruit_b` VALUES ('1', 'chengzi', 'yellow');
INSERT INTO `test_fruit_b` VALUES ('2', 'xiangjiao', 'yellow');
INSERT INTO `test_fruit_b` VALUES ('3', 'xigua', 'green');
INSERT INTO `test_fruit_b` VALUES ('4', 'tizi', 'red');

-- ----------------------------
-- Table structure for test_fruit_tl
-- ----------------------------
DROP TABLE IF EXISTS `test_fruit_tl`;
CREATE TABLE `test_fruit_tl` (
  `fruit_id` int(10) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_fruit_tl
-- ----------------------------

-- ----------------------------
-- Table structure for test_goods_b
-- ----------------------------
DROP TABLE IF EXISTS `test_goods_b`;
CREATE TABLE `test_goods_b` (
  `goods_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT NULL,
  `REQUEST_ID` bigint(20) DEFAULT NULL,
  `PROGRAM_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(255) DEFAULT NULL,
  `LAST_UPDATED_BY` bigint(20) DEFAULT NULL,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `LAST_UPDATE_DATE` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `ATTRIBUTE_CATEGORY` varchar(255) DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) DEFAULT NULL,
  `ATTRIBUTE11` varchar(255) DEFAULT NULL,
  `ATTRIBUTE12` varchar(255) DEFAULT NULL,
  `ATTRIBUTE13` varchar(255) DEFAULT NULL,
  `ATTRIBUTE14` varchar(255) DEFAULT NULL,
  `ATTRIBUTE15` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_goods_b
-- ----------------------------
INSERT INTO `test_goods_b` VALUES ('1', '1', '苹果k ', '红色', '水果', null, '-1', '-1', null, '10001', '10001', '2017-04-04 08:58:34.308223', '2017-04-04 08:58:34.000000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `test_goods_b` VALUES ('2', '1', '雪碧', '无色', '饮料', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `test_goods_b` VALUES ('3', '2', '干脆面', '黄色', '面食', null, '-1', '-1', null, '10001', '10001', '2017-03-30 17:50:42.947888', '2017-03-30 17:50:42.000000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `test_goods_b` VALUES ('4', '2', '毛巾', '白色', '日常用品', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `test_goods_b` VALUES ('5', '2', '杯子', '白色', '日常用品', null, '-1', '-1', null, '10001', '10001', '2017-03-30 16:02:00.486426', '2017-03-30 16:02:00.000000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `test_goods_b` VALUES ('6', null, 'sadfefwe', '黄色', 'sdsfret', null, '-1', '-1', '10001', '10001', '10001', '2017-03-30 17:19:49.775000', '2017-03-30 17:19:49.775000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `test_goods_b` VALUES ('7', '6', 'qwerqwe', 'qewrqew', 'qewrqwer', null, '-1', '-1', '10001', '10001', '10001', '2017-03-30 18:09:01.138000', '2017-03-30 18:09:01.138000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `test_goods_b` VALUES ('8', '0', '', '', '', null, '-1', '-1', '10001', '10001', '10001', '2017-04-04 08:58:40.186000', '2017-04-04 08:58:40.186000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for test_goods_tl
-- ----------------------------
DROP TABLE IF EXISTS `test_goods_tl`;
CREATE TABLE `test_goods_tl` (
  `goods_id` int(10) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT NULL,
  `REQUEST_ID` bigint(20) DEFAULT NULL,
  `PROGRAM_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_BY` bigint(20) DEFAULT NULL,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `LAST_UPDATE_DATE` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_goods_tl
-- ----------------------------
INSERT INTO `test_goods_tl` VALUES ('1', 'zh_CN', '苹果k ', '水果', '红色', null, null, null, null, '10001', null, '2017-04-04 08:58:34.311230', '2017-04-04 08:58:34.000000');
INSERT INTO `test_goods_tl` VALUES ('2', 'zh_CN', '雪碧', '饮料', '无色', null, null, null, null, null, null, '2017-03-30 15:58:57.984218', '2017-03-30 15:58:57.984218');
INSERT INTO `test_goods_tl` VALUES ('3', 'zh_CN', '干脆面', '面食', '黄色', null, null, null, null, '10001', null, '2017-03-30 17:50:42.949892', '2017-03-30 17:50:42.000000');
INSERT INTO `test_goods_tl` VALUES ('4', 'zh_CN', '毛巾', '日常用品', '白色', null, null, null, null, null, null, '2017-03-30 15:58:59.754544', '2017-03-30 15:58:59.754544');
INSERT INTO `test_goods_tl` VALUES ('5', 'zh_CN', '杯子', '日常用品', '白色', null, null, null, null, '10001', null, '2017-03-30 16:02:00.490436', '2017-03-30 16:02:00.000000');
INSERT INTO `test_goods_tl` VALUES ('1', 'en_GB', 'appleee', 'fruit', 'red', null, null, null, null, '10001', null, '2017-04-04 08:58:34.310228', '2017-04-04 08:58:34.000000');
INSERT INTO `test_goods_tl` VALUES ('2', 'en_GB', 'Spring', 'drink', 'transparent', null, null, null, null, null, null, '2017-03-30 16:01:06.306269', '2017-03-30 16:01:06.306269');
INSERT INTO `test_goods_tl` VALUES ('5', 'en_GB', 'cup', '日常用品', '白色', null, null, null, '10001', '10001', null, '2017-03-30 16:02:00.000000', '2017-03-30 16:02:00.000000');
INSERT INTO `test_goods_tl` VALUES ('6', 'en_GB', 'werew', 'yuieyfui', 'yellow', null, null, null, '10001', '10001', null, '2017-03-30 17:19:49.000000', '2017-03-30 17:19:49.000000');
INSERT INTO `test_goods_tl` VALUES ('6', 'zh_CN', 'sadfefwe', 'sdsfret', '黄色', null, null, null, '10001', '10001', null, '2017-03-30 17:19:49.000000', '2017-03-30 17:19:49.000000');
INSERT INTO `test_goods_tl` VALUES ('3', 'en_GB', 'gancuimian', 'noddles', 'yellow', null, null, null, '10001', '10001', null, '2017-03-30 17:50:42.948890', '2017-03-30 17:50:42.000000');
INSERT INTO `test_goods_tl` VALUES ('7', 'en_GB', 'werq', 'qwer', 'qwerqe', null, null, null, '10001', '10001', null, '2017-03-30 18:09:01.000000', '2017-03-30 18:09:01.000000');
INSERT INTO `test_goods_tl` VALUES ('7', 'zh_CN', 'qwerqwe', 'qewrqwer', 'qewrqew', null, null, null, '10001', '10001', null, '2017-03-30 18:09:01.000000', '2017-03-30 18:09:01.000000');
INSERT INTO `test_goods_tl` VALUES ('8', 'en_GB', '', '', '', null, null, null, '10001', '10001', null, '2017-04-04 08:58:40.000000', '2017-04-04 08:58:40.000000');
INSERT INTO `test_goods_tl` VALUES ('8', 'zh_CN', '', '', '', null, null, null, '10001', '10001', null, '2017-04-04 08:58:40.000000', '2017-04-04 08:58:40.000000');

-- ----------------------------
-- Table structure for test_user_b
-- ----------------------------
DROP TABLE IF EXISTS `test_user_b`;
CREATE TABLE `test_user_b` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `birthday` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT NULL,
  `REQUEST_ID` bigint(20) DEFAULT NULL,
  `PROGRAM_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `LAST_UPDATED_BY` bigint(20) DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) DEFAULT NULL,
  `ATTRIBUTE11` varchar(255) DEFAULT NULL,
  `ATTRIBUTE12` varchar(255) DEFAULT NULL,
  `ATTRIBUTE13` varchar(255) DEFAULT NULL,
  `ATTRIBUTE14` varchar(255) DEFAULT NULL,
  `ATTRIBUTE15` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_user_b
-- ----------------------------
INSERT INTO `test_user_b` VALUES ('9', '张三', '123@qq.com', '1324578943', '2017-04-19 00:00:00.000000', null, '-1', '-1', '10001', '2017-04-01 09:00:19.245000', '10001', '2017-04-01 09:00:19.245000', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `test_user_b` VALUES ('12', '李四', '123@139.com', '132768493', '2017-04-16 00:00:00.000000', null, '-1', '-1', '10001', '2017-04-01 13:15:32.244252', '10001', '2017-04-01 13:15:32.000000', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `test_user_b` VALUES ('13', '王五', '123@126.com', '2432114532', '2017-04-17 00:00:00.000000', null, '-1', '-1', '10001', '2017-04-01 09:03:29.627000', '10001', '2017-04-01 09:03:29.627000', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for test_user_tl
-- ----------------------------
DROP TABLE IF EXISTS `test_user_tl`;
CREATE TABLE `test_user_tl` (
  `user_id` int(10) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT NULL,
  `REQUEST_ID` bigint(20) DEFAULT NULL,
  `PROGRAM_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_user_tl
-- ----------------------------
INSERT INTO `test_user_tl` VALUES ('9', 'en_GB', 'zhangsan', null, null, null, '10001', '2017-04-01 09:00:19', '10001', '2017-04-01 09:00:19', null);
INSERT INTO `test_user_tl` VALUES ('9', 'zh_CN', '张三', null, null, null, '10001', '2017-04-01 09:00:19', '10001', '2017-04-01 09:00:19', null);
INSERT INTO `test_user_tl` VALUES ('12', 'en_GB', 'lisi', null, null, null, '10001', '2017-04-01 09:02:45', '10001', '2017-04-01 09:02:45', null);
INSERT INTO `test_user_tl` VALUES ('12', 'zh_CN', '李四', null, null, null, '10001', '2017-04-01 13:15:32', '10001', '2017-04-01 13:15:32', null);
INSERT INTO `test_user_tl` VALUES ('13', 'en_GB', 'wangwu', null, null, null, '10001', '2017-04-01 09:03:29', '10001', '2017-04-01 09:03:29', null);
INSERT INTO `test_user_tl` VALUES ('13', 'zh_CN', '王五', null, null, null, '10001', '2017-04-01 09:03:29', '10001', '2017-04-01 09:03:29', null);

-- ----------------------------
-- Table structure for wfl_approve_chain_header
-- ----------------------------
DROP TABLE IF EXISTS `wfl_approve_chain_header`;
CREATE TABLE `wfl_approve_chain_header` (
  `APPROVE_CHAIN_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROCESS_KEY` varchar(255) NOT NULL,
  `USERTASK_ID` varchar(255) NOT NULL,
  `ENABLE_FLAG` varchar(1) DEFAULT 'Y' COMMENT '是否启用',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`APPROVE_CHAIN_ID`),
  UNIQUE KEY `WFL_APPROVE_CHAIN_HEADER_U1` (`PROCESS_KEY`,`USERTASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批链定义 头表';

-- ----------------------------
-- Records of wfl_approve_chain_header
-- ----------------------------

-- ----------------------------
-- Table structure for wfl_approve_chain_line
-- ----------------------------
DROP TABLE IF EXISTS `wfl_approve_chain_line`;
CREATE TABLE `wfl_approve_chain_line` (
  `APPROVE_CHAIN_LINE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `APPROVE_CHAIN_ID` bigint(20) DEFAULT NULL COMMENT '头 id',
  `NAME` varchar(255) NOT NULL COMMENT '名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `APPROVE_TYPE` varchar(40) DEFAULT 'NONE' COMMENT '审批类型',
  `ASSIGNEE` varchar(200) DEFAULT NULL COMMENT '审批人',
  `ASSIGN_GROUP` varchar(200) DEFAULT NULL COMMENT '审批组',
  `FORM_KEY` varchar(255) DEFAULT NULL COMMENT '审批页面',
  `SEQUENCE` decimal(18,2) DEFAULT '10.00' COMMENT '排序号，可以为小数',
  `SKIP_EXPRESSION` varchar(255) DEFAULT NULL COMMENT '跳过条件,留空表示不跳过 (false)',
  `BREAK_ON_SKIP` varchar(1) DEFAULT 'N' COMMENT '该规则被跳过时,停止继续走其他规则',
  `ENABLE_FLAG` varchar(1) DEFAULT 'Y' COMMENT '是否启用',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`APPROVE_CHAIN_LINE_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  KEY `WFL_APPROVE_CHAIN_LINE_N1` (`APPROVE_CHAIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批链定义 行表';

-- ----------------------------
-- Records of wfl_approve_chain_line
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
