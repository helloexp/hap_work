package com.hand.hap.db

import com.hand.hap.liquibase.MigrationHelper

def mhi = MigrationHelper.getInstance()
dbType = mhi.dbType()
databaseChangeLog(logicalFilePath:"2016-06-09-init-table-migration.groovy"){

    changeSet(author: "hailor", id: "20160609-hailor-1") {
        sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/quartz_2.2.3.sql"), encoding: "UTF-8")
    }

    changeSet(author: "hailor", id: "20160609-hailor-2") {
        //    sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_code.sql"), encoding: "UTF-8")

        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_CODE_B_S', startValue:"10001")
        }
        createTable(tableName: "SYS_CODE_B"){
            column(name:"CODE_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks:"代码ID"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_CODE_B_PK")
            }
            column(name:"CODE",type:"varchar(30)",remarks:"快码类型"){
                constraints(nullable: "false",unique:"true",uniqueConstraintName:"SYS_CODE_B_U1")
            }
            column(name:"DESCRIPTION",type:'varchar(240)',remarks: "快码类型描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        createTable(tableName:"SYS_CODE_TL"){
            column(name:"CODE_ID",type:"bigint",remarks: "代码ID"){
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name:"LANG",type:"varchar(10)",remarks: "语言"){
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name:"DESCRIPTION",type:"varchar(240)",remarks: "快码描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }

    }

    changeSet(author: "hailor", id: "20160609-hailor-3") {
        //    sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_code_value.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_CODE_VALUE_B_S', startValue:"10001")
        }
        createTable(tableName: "SYS_CODE_VALUE_B"){
            column(name:"CODE_VALUE_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks:"表ID，主键，供其他表做外键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_CODE_VALUE_B_PK")
            }
            column(name:"CODE_ID",type:"bigint")
            column(name:"VALUE",type:"varchar(150)",remarks: "快码值")
            column(name:"MEANING",type:"varchar(150)",remarks: "快码意思")
            column(name:"DESCRIPTION",type:"varchar(240)",remarks:"快码描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        addUniqueConstraint(columnNames:"CODE_ID,VALUE",tableName:"SYS_CODE_VALUE_B",constraintName: "SYS_CODE_VALUE_B_U1")


        createTable(tableName:"SYS_CODE_VALUE_TL"){
            column(name:"CODE_VALUE_ID",type:"bigint",remarks: "代码ID"){
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name:"LANG",type:"varchar(10)",remarks: "语言"){
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name:"MEANING",type:"varchar(150)",remarks: "快码意思")
            column(name:"DESCRIPTION",type:"varchar(240)",remarks: "快码描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }


    }

    changeSet(author: "hailor", id: "20160609-hailor-4") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_function.sql"), encoding: "UTF-8")

        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_FUNCTION_B_S', startValue:"10001")
        }
        createTable(tableName: "SYS_FUNCTION_B"){
            column(name:"FUNCTION_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks:"表ID，主键，供其他表做外键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_FUNCTION_B_PK")
            }
            column(name:"MODULE_CODE",type:"varchar(30)",remarks: "模块编码")
            column(name:"FUNCTION_ICON",type:"varchar(100)",remarks: "功能图标")
            column(name:"FUNCTION_CODE",type:"varchar(30)",remarks:"功能编码"){
                constraints(nullable: "false",unique: "true",uniqueConstraintName: "SYS_FUNCTION_B_U1")
            }
            column(name:"FUNCTION_NAME",type:"varchar(150)",remarks: "功能名称")
            column(name:"FUNCTION_DESCRIPTION",type:"varchar(240)",remarks:"描述")
            column(name:"RESOURCE_ID",type:"bigint",remarks: "功能入口")
            column(name:"TYPE",type:"varchar(30)",remarks:"功能类型")
            column(name:"PARENT_FUNCTION_ID",type: "bigint",remarks: "父功能")
            column(name:"ENABLED_FLAG",type:"varchar(1)",remarks: "是否启用",defaultValue: "Y")
            column(name:"FUNCTION_SEQUENCE",type:"decimal(20,0)",remarks: "排序号",defaultValue: "1")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        createIndex(tableName:"SYS_FUNCTION_B",indexName:"SYS_FUNCTION_B_N1"){column(name: "PARENT_FUNCTION_ID",type: "bigint")}

        createTable(tableName:"SYS_FUNCTION_TL") {
            column(name: "FUNCTION_ID", type: "bigint", remarks: "功能ID") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "LANG", type: "varchar(10)", remarks: "语言") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "FUNCTION_NAME", type: "varchar(150)", remarks: "功能名")
            column(name: "FUNCTION_DESCRIPTION", type: "varchar(240)", remarks: "功能描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue: "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue: "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue: "-1")
            column(name: "ATTRIBUTE_CATEGORY", type: "varchar(30)")
            column(name: "ATTRIBUTE1", type: "varchar(240)")
            column(name: "ATTRIBUTE2", type: "varchar(240)")
            column(name: "ATTRIBUTE3", type: "varchar(240)")
            column(name: "ATTRIBUTE4", type: "varchar(240)")
            column(name: "ATTRIBUTE5", type: "varchar(240)")
            column(name: "ATTRIBUTE6", type: "varchar(240)")
            column(name: "ATTRIBUTE7", type: "varchar(240)")
            column(name: "ATTRIBUTE8", type: "varchar(240)")
            column(name: "ATTRIBUTE9", type: "varchar(240)")
            column(name: "ATTRIBUTE10", type: "varchar(240)")
            column(name: "ATTRIBUTE11", type: "varchar(240)")
            column(name: "ATTRIBUTE12", type: "varchar(240)")
            column(name: "ATTRIBUTE13", type: "varchar(240)")
            column(name: "ATTRIBUTE14", type: "varchar(240)")
            column(name: "ATTRIBUTE15", type: "varchar(240)")
        }
    }

    changeSet(author: "hailor", id: "20160609-hailor-5") {
        //  sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_function_resource.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_FUNCTION_RESOURCE_S', startValue:"10001")
        }
        createTable(tableName: "SYS_FUNCTION_RESOURCE"){
            column(name:"FUNC_SRC_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks:"表ID，主键，供其他表做外键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_FUNCTION_RESOURCE_PK")
            }
            column(name:"FUNCTION_ID",type:"bigint",remarks: "外键，功能 ID")
            column(name:"RESOURCE_ID",type:"bigint")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        addUniqueConstraint(columnNames:"FUNCTION_ID,RESOURCE_ID",tableName:"SYS_FUNCTION_RESOURCE",constraintName: "SYS_FUNCTION_RESOURCE_U1")

    }

    changeSet(author: "hailor", id: "20160609-hailor-6") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_job_running_info.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_JOB_RUNNING_INFO_S', startValue:"10001")
        }
        createTable(tableName: "SYS_JOB_RUNNING_INFO"){
            column(name:"JOB_RUNNING_INFO_ID",type:"bigint",autoIncrement: "true", startWith:"10001"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_JOB_RUNNING_INFO_PK")
            }
            column(name:"JOB_NAME",type:"varchar(225)")
            column(name:"JOB_GROUP",type:"varchar(225)")
            column(name:"JOB_RESULT",type:"varchar(225)")
            column(name:"JOB_STATUS",type:"varchar(225)")
            column(name:"JOB_STATUS_MESSAGE",type:"varchar(225)")
            column(name:"TRIGGER_NAME",type:"varchar(225)")
            column(name:"TRIGGER_GROUP",type:"varchar(225)")
            column(name:"PREVIOUS_FIRE_TIME",type:"datetime")
            column(name:"FIRE_TIME",type:"datetime")
            column(name:"NEXT_FIRE_TIME",type:"datetime")
            column(name:"REFIRE_COUNT",type:"bigint",defaultValue: "0")
            column(name:"FIRE_INSTANCE_ID",type:"varchar(225)")
            column(name:"SCHEDULER_INSTANCE_ID",type:"varchar(225)")
            column(name:"SCHEDULED_FIRE_TIME",type:"datetime")
            column(name:"EXECUTION_SUMMARY",type:"varchar(225)")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
    }

    changeSet(author: "hailor", id: "20160609-hailor-7") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_lang.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            //createSequence(sequenceName: 'SYS_LANG_B_S', startValue:"10001")
        }
        createTable(tableName: "SYS_LANG_B"){
            column(name:"LANG_CODE",type:"varchar(10)",remarks: "表ID，主键，供其他表做外键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_LANG_B_PK")
            }
            column(name:"BASE_LANG",type:"varchar(10)",remarks: "基语言")
            column(name:"DESCRIPTION",type:"varchar(240)",remarks: "描述")
            column(name:"JOB_RESULT",type:"varchar(225)")
            column(name:"JOB_STATUS",type:"varchar(225)")
            column(name:"JOB_STATUS_MESSAGE",type:"varchar(225)")
            column(name:"TRIGGER_NAME",type:"varchar(225)")
            column(name:"TRIGGER_GROUP",type:"varchar(225)")
            column(name:"PREVIOUS_FIRE_TIME",type:"datetime")
            column(name:"FIRE_TIME",type:"datetime")
            column(name:"NEXT_FIRE_TIME",type:"datetime")
            column(name:"REFIRE_COUNT",type:"bigint",defaultValue: "0")
            column(name:"FIRE_INSTANCE_ID",type:"varchar(225)")
            column(name:"SCHEDULER_INSTANCE_ID",type:"varchar(225)")
            column(name:"SCHEDULED_FIRE_TIME",type:"datetime")
            column(name:"EXECUTION_SUMMARY",type:"varchar(225)")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
    }

    changeSet(author: "hailor", id: "20160609-hailor-8") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_lov.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_LOV_S', startValue:"10001")
        }
        createTable(tableName: "SYS_LOV"){
            column(name:"LOV_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_LOV_PK")
            }
            column(name:"CODE",type:"varchar(80)",remarks: "LOV的code"){
                constraints(nullable: "false",unique: "true",uniqueConstraintName: "SYS_LOV_U1")
            }
            column(name:"DESCRIPTION",type:"varchar(240)",remarks: "描述")
            column(name:"SQL_ID",type:"varchar(225)",remarks: "SQL ID")
            column(name:"VALUE_FIELD",type:"varchar(80)",remarks: " VALUE_FIELD")
            column(name:"TEXT_FIELD",type:"varchar(80)",remarks: "TEXT_FIELD")
            column(name:"TITLE",type:"varchar(225)",remarks: "标题")
            column(name:"WIDTH",type: "decimal(20,0)",remarks: "宽度")
            column(name:"HEIGHT",type: "decimal(20,0)",remarks: "高度")
            column(name:"PLACEHOLDER",type:"varchar(80)",remarks: "提示")
            column(name:"DELAY_LOAD",type: "varchar(1)",defaultValue: "N",remarks: "是否延迟加载")
            column(name:"NEED_QUERY_PARAM",type: "varchar(1)",defaultValue: "N",remarks: "是否需要查询条件")
            column(name:"EDITABLE",type: "varchar(1)",defaultValue: "N",remarks: "是否可编辑")
            column(name:"CAN_POPUP",type: "varchar(1)",defaultValue: "Y",remarks: "是否可弹出")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
    }

    changeSet(author: "hailor", id: "20160609-hailor-9") {
        //sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_lov_item.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_LOV_ITEM_S', startValue:"10001")
        }
        createTable(tableName: "SYS_LOV_ITEM"){
            column(name:"LOV_ITEM_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_LOV_ITEM_PK")
            }
            column(name:"LOV_ID",type:"bigint",remarks: "头表ID")
            column(name:"DISPLAY",type:"varchar(255)",remarks: "描述字段")
            column(name:"IS_AUTOCOMPLETE",type:"varchar(1)",defaultValue: "N", remarks: "是否autocomplete")
            column(name:"CONDITION_FIELD",type:"varchar(80)",defaultValue: "N",remarks: " 是否查询字段")
            column(name:"CONDITION_FIELD_WIDTH",type:"decimal(20,0)",remarks: "查询字段宽度")
            column(name:"CONDITION_FIELD_TYPE",type:"varchar(30)",remarks: "查询字段组件类型")
            column(name:"CONDITION_FIELD_NAME",type: "varchar(80)",remarks: "查询字段名")
            column(name:"CONDITION_FIELD_NEWLINE",type: "varchar(1)",remarks: "查询字段新一行")
            column(name:"CONDITION_FIELD_SELECT_CODE",type:"varchar(80)",remarks: "查询字段combobox对应的快码值")
            column(name:"CONDITION_FIELD_LOV_CODE",type: "varchar(80)",remarks: "查询字段lov对应的通用lov编码")
            column(name:"CONDITION_FIELD_SEQUENCE",type: "decimal(20,0)",remarks: "查询字段排序号")
            column(name:"CONDITION_FIELD_SELECT_URL",type: "varchar(255)",remarks: "查询字段combobox对应的URL")
            column(name:"CONDITION_FIELD_SELECT_VF",type: "varchar(80)",remarks: "查询字段combobox对应的valueField")
            column(name:"CONDITION_FIELD_SELECT_TF" ,type: "varchar(80)",remarks:"查询字段combobox对应的textField")
            column(name:"CONDITION_FIELD_TEXTFIELD" ,type: "varchar(80)",remarks:"查询字段对应的textField")
            column(name:"AUTOCOMPLETE_FIELD",type:"varchar(1)",defaultValue: "Y",remarks: "autocomplete显示列")
            column(name:"GRID_FIELD",type:"varchar(1)",defaultValue: "Y",remarks: "是否显示表格列")
            column(name:"GRID_FIELD_NAME",type: "varchar(80)",remarks: "表格列字段名")
            column(name:"GRID_FIELD_SEQUENCE",type: "decimal(20,0)",defaultValue: "1",remarks: "表格列排序号")
            column(name:"GRID_FIELD_WIDTH",type: "decimal(20,0)",remarks: "表格列宽")
            column(name:"GRID_FIELD_ALIGN",type: "varchar(10)",defaultValue: "center",remarks: "表格列布局")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        createIndex(tableName:"SYS_LOV_ITEM",indexName:"SYS_LOV_ITEM_N1"){column(name: "LOV_ID",type: "bigint")}

    }

    changeSet(author: "hailor", id: "20160609-hailor-10") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_message.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_MESSAGE_S', startValue:"10001")
        }
        createTable(tableName: "SYS_MESSAGE"){
            column(name:"MESSAGE_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_MESSAGE_PK")
            }
            column(name:"MESSAGE_TYPE",type:"varchar(10)",remarks: "信息类型,email/sms")
            column(name:"MESSAGE_HOST",type:"varchar(255)",remarks: "消息服务器")
            column(name:"MESSAGE_FROM",type:"varchar(255)", remarks: "消息发出人")
            column(name:"SUBJECT",type:"varchar(255)",remarks: " 标题")
            column(name:"CONTENT",type:"clob",remarks: "内容")
            column(name:"PRIORITY_LEVEL",type:"varchar(25)",remarks: "优先级")
            column(name:"SEND_FLAG",type: "varchar(1)",defaultValue: "N", remarks: "发送标记")
            column(name:"MESSAGE_SOURCE",type: "varchar(255)",remarks: "消息来源")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        createIndex(tableName:"SYS_MESSAGE",indexName:"SYS_MESSAGE_N1"){column(name: "MESSAGE_TYPE",type: "varchar(10)")}

    }

    changeSet(author: "hailor", id: "20160609-hailor-11") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_message_account.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_MESSAGE_ACCOUNT_S', startValue:"10001")
        }
        createTable(tableName: "SYS_MESSAGE_ACCOUNT"){
            column(name:"ACCOUNT_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_MESSAGE_ACCOUNT_PK")
            }
            column(name:"ACCOUNT_TYPE",type:"varchar(50)",remarks: "账号类型")
            column(name:"ACCOUNT_CODE",type:"varchar(50)",remarks: "编号")
            column(name:"USER_NAME",type:"varchar(240)", remarks: "用户名")
            column(name:"PASSWORD",type:"varchar(240)",remarks: " 密码")
            column(name:"DESCRIPTION",type:"varchar(240)",remarks: "描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
    }

    changeSet(author: "hailor", id: "20160609-hailor-12") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_profile.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_PROFILE_S', startValue:"10001")
        }
        createTable(tableName: "SYS_PROFILE"){
            column(name:"PROFILE_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_PROFILE_PK")
            }
            column(name:"PROFILE_NAME",type:"varchar(40)",remarks: "配置文件名称"){
                constraints(nullable: "false", unique: "true",uniqueConstraintName: "SYS_PROFILE_U1")
            }
            column(name:"DESCRIPTION",type:"varchar(240)",remarks: "描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
    }

    changeSet(author: "hailor", id: "20160609-hailor-13") {
        //sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_profile_value.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_PROFILE_VALUE_S', startValue:"10001")
        }
        createTable(tableName: "SYS_PROFILE_VALUE"){
            column(name:"PROFILE_VALUE_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_PROFILE_VALUE_PK")
            }
            column(name:"PROFILE_ID",type:"varchar(32)",remarks: "配置文件ID")
            column(name:"LEVEL_ID",type:"varchar(32)",remarks: "层次ID")
            column(name:"LEVEL_VALUE",type:"varchar(40)",remarks: "层次值")
            column(name:"PROFILE_VALUE",type:"varchar(80)",remarks: "配置文件值")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        addUniqueConstraint(tableName: "SYS_PROFILE_VALUE",columnNames: "PROFILE_ID,LEVEL_ID,LEVEL_VALUE",constraintName: "SYS_PROFILE_VALUE_U1")
    }

    changeSet(author: "hailor", id: "20160609-hailor-14") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_prompts.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_PROMPTS_S', startValue:"10001")
        }
        createTable(tableName: "SYS_PROMPTS"){
            column(name:"PROMPT_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_PROMPTS_PK")
            }
            column(name:"PROMPT_CODE",type:"varchar(255)",remarks: "文本编码")
            column(name:"LANG",type:"varchar(10)",remarks: "语言")
            column(name:"DESCRIPTION",type:"varchar(240)",remarks: "描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        addUniqueConstraint(columnNames:"PROMPT_CODE,LANG",tableName:"SYS_PROMPTS",constraintName: "SYS_PROMPTS_U1")

    }

    changeSet(author: "hailor", id: "20160609-hailor-15") {
        //    sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_resource.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_RESOURCE_B_S', startValue:"10001")
        }
        createTable(tableName: "SYS_RESOURCE_B"){
            column(name:"RESOURCE_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_RESOURCE_B_PK")
            }
            column(name:"URL",type:"varchar(255)",remarks: "URL"){
                constraints(nullable: "false",unique: "true",uniqueConstraintName: "SYS_RESOURCE_B_U1")
            }
            column(name:"TYPE",type:"varchar(15)",remarks: "资源类型")
            column(name:"NAME",type:"varchar(40)",remarks: "资源名称")
            column(name:"DESCRIPTION",type: "varchar(240)",remarks: "描述")
            column(name:"LOGIN_REQUIRE",type: "varchar(1)",defaultValue: "Y",remarks: "是否需要登录")
            column(name:"ACCESS_CHECK",type: "varchar(1)",defaultValue: "Y",remarks: "是否权限校验")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }

        createTable(tableName:"SYS_RESOURCE_TL") {
            column(name: "RESOURCE_ID", type: "bigint", remarks: "表ID，主键，供其他表做外键") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "LANG", type: "varchar(10)", remarks: "语言") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "NAME", type: "varchar(40)", remarks: "资源名称")
            column(name: "DESCRIPTION", type: "varchar(240)", remarks: "描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue: "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue: "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue: "-1")
            column(name: "ATTRIBUTE_CATEGORY", type: "varchar(30)")
            column(name: "ATTRIBUTE1", type: "varchar(240)")
            column(name: "ATTRIBUTE2", type: "varchar(240)")
            column(name: "ATTRIBUTE3", type: "varchar(240)")
            column(name: "ATTRIBUTE4", type: "varchar(240)")
            column(name: "ATTRIBUTE5", type: "varchar(240)")
            column(name: "ATTRIBUTE6", type: "varchar(240)")
            column(name: "ATTRIBUTE7", type: "varchar(240)")
            column(name: "ATTRIBUTE8", type: "varchar(240)")
            column(name: "ATTRIBUTE9", type: "varchar(240)")
            column(name: "ATTRIBUTE10", type: "varchar(240)")
            column(name: "ATTRIBUTE11", type: "varchar(240)")
            column(name: "ATTRIBUTE12", type: "varchar(240)")
            column(name: "ATTRIBUTE13", type: "varchar(240)")
            column(name: "ATTRIBUTE14", type: "varchar(240)")
            column(name: "ATTRIBUTE15", type: "varchar(240)")
        }
    }

    changeSet(author: "hailor", id: "20160609-hailor-16") {
        //  sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_resource_item.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_RESOURCE_ITEM_B_S', startValue:"10001")
        }
        createTable(tableName: "SYS_RESOURCE_ITEM_B"){
            column(name:"RESOURCE_ITEM_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_RESOURCE_ITEM_B_PK")
            }
            column(name:"OWNER_RESOURCE_ID",type:"bigint",remarks: "功能资源ID")
            column(name:"TARGET_RESOURCE_ID",type:"bigint",remarks: "目标资源ID")
            column(name:"ITEM_ID",type:"varchar(50)",remarks: "HTML中控件ID")
            column(name:"ITEM_NAME",type:"varchar(50)",remarks: "控件名称")
            column(name:"DESCRIPTION",type: "varchar(240)",remarks: "描述")
            column(name:"ITEM_TYPE",type: "varchar(10)",remarks: "控件类型")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        addUniqueConstraint(columnNames:"ITEM_ID,OWNER_RESOURCE_ID",tableName:"SYS_RESOURCE_ITEM_B",constraintName: "SYS_RESOURCE_ITEM_B_U1")
        createIndex(tableName:"SYS_RESOURCE_ITEM_B",indexName:"SYS_RESOURCE_ITEM_B_N1"){column(name: "OWNER_RESOURCE_ID",type: "bigint")}


        createTable(tableName:"SYS_RESOURCE_ITEM_TL") {
            column(name: "RESOURCE_ITEM_ID", type: "bigint", remarks: "表ID，主键，供其他表做外键") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "LANG", type: "varchar(10)", remarks: "语言") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "ITEM_NAME", type: "varchar(150)", remarks: "控件名称")
            column(name: "DESCRIPTION", type: "varchar(240)", remarks: "描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue: "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue: "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue: "-1")
            column(name: "ATTRIBUTE_CATEGORY", type: "varchar(30)")
            column(name: "ATTRIBUTE1", type: "varchar(240)")
            column(name: "ATTRIBUTE2", type: "varchar(240)")
            column(name: "ATTRIBUTE3", type: "varchar(240)")
            column(name: "ATTRIBUTE4", type: "varchar(240)")
            column(name: "ATTRIBUTE5", type: "varchar(240)")
            column(name: "ATTRIBUTE6", type: "varchar(240)")
            column(name: "ATTRIBUTE7", type: "varchar(240)")
            column(name: "ATTRIBUTE8", type: "varchar(240)")
            column(name: "ATTRIBUTE9", type: "varchar(240)")
            column(name: "ATTRIBUTE10", type: "varchar(240)")
            column(name: "ATTRIBUTE11", type: "varchar(240)")
            column(name: "ATTRIBUTE12", type: "varchar(240)")
            column(name: "ATTRIBUTE13", type: "varchar(240)")
            column(name: "ATTRIBUTE14", type: "varchar(240)")
            column(name: "ATTRIBUTE15", type: "varchar(240)")
        }
    }

    changeSet(author: "hailor", id: "20160609-hailor-17") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_role.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_ROLE_B_S', startValue:"10001")
        }
        createTable(tableName: "SYS_ROLE_B"){
            column(name:"ROLE_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_ROLE_B_PK")
            }
            column(name:"ROLE_CODE",type:"varchar(40)",remarks: "角色编码"){
                constraints(nullable: "false",unique: "true",uniqueConstraintName: "SYS_ROLE_B_U1")
            }
            column(name:"ROLE_NAME",type:"varchar(150)",remarks: "角色名称"){
                constraints(nullable: "false")
            }
            column(name:"ROLE_DESCRIPTION",type:"varchar(240)",remarks: "角色描述")
            column(name:"START_ACTIVE_DATE",type:"DATE",remarks:"开始生效日期")
            column(name:"END_ACTIVE_DATE",type:"DATE",remarks:"截至生效日期")
            column(name:"ENABLE_FLAG",type:"VARCHAR(1)",remarks:"启用标记", defaultValue: "Y")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }

        createTable(tableName:"SYS_ROLE_TL") {
            column(name: "ROLE_ID", type: "bigint", remarks: "角色ID") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "LANG", type: "varchar(10)", remarks: "语言") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "ROLE_NAME", type: "varchar(150)", remarks: "角色名称")
            column(name: "ROLE_DESCRIPTION", type: "varchar(240)", remarks: "角色描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue: "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue: "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue: "-1")
            column(name: "ATTRIBUTE_CATEGORY", type: "varchar(30)")
            column(name: "ATTRIBUTE1", type: "varchar(240)")
            column(name: "ATTRIBUTE2", type: "varchar(240)")
            column(name: "ATTRIBUTE3", type: "varchar(240)")
            column(name: "ATTRIBUTE4", type: "varchar(240)")
            column(name: "ATTRIBUTE5", type: "varchar(240)")
            column(name: "ATTRIBUTE6", type: "varchar(240)")
            column(name: "ATTRIBUTE7", type: "varchar(240)")
            column(name: "ATTRIBUTE8", type: "varchar(240)")
            column(name: "ATTRIBUTE9", type: "varchar(240)")
            column(name: "ATTRIBUTE10", type: "varchar(240)")
            column(name: "ATTRIBUTE11", type: "varchar(240)")
            column(name: "ATTRIBUTE12", type: "varchar(240)")
            column(name: "ATTRIBUTE13", type: "varchar(240)")
            column(name: "ATTRIBUTE14", type: "varchar(240)")
            column(name: "ATTRIBUTE15", type: "varchar(240)")
        }
    }

    changeSet(author: "hailor", id: "20160609-hailor-18") {
        //  sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_role_function.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_ROLE_FUNCTION_S', startValue:"10001")
        }
        createTable(tableName: "SYS_ROLE_FUNCTION"){
            column(name:"SRF_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_ROLE_FUNCTION_PK")
            }
            column(name:"ROLE_ID",type:"bigint",remarks: "功能ID")
            column(name:"FUNCTION_ID",type:"bigint",remarks: "功能ID")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        addUniqueConstraint(columnNames:"ROLE_ID,FUNCTION_ID",tableName:"SYS_ROLE_FUNCTION",constraintName: "SYS_ROLE_FUNCTION_U1")

    }

    changeSet(author: "hailor", id: "20160609-hailor-19") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_role_resource_item.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_ROLE_RESOURCE_ITEM_S', startValue:"10001")
        }
        createTable(tableName: "SYS_ROLE_RESOURCE_ITEM"){
            column(name:"RSI_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_ROLE_RESOURCE_ITEM_PK")
            }
            column(name:"ROLE_ID",type:"bigint",remarks: "角色ID")
            column(name:"RESOURCE_ITEM_ID",type:"bigint",remarks: "功能控件ID")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        addUniqueConstraint(columnNames:"ROLE_ID,RESOURCE_ITEM_ID",tableName:"SYS_ROLE_RESOURCE_ITEM",constraintName: "SYS_ROLE_RESOURCE_ITEM_U1")
        createIndex(tableName:"SYS_ROLE_RESOURCE_ITEM",indexName:"SYS_ROLE_RESOURCE_ITEM_N1"){column(name: "ROLE_ID",type: "bigint")}

    }

    changeSet(author: "hailor", id: "20160609-hailor-20") {
        //sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_user.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_USER_S', startValue:"10001")
        }
        createTable(tableName: "SYS_USER"){
            column(name:"USER_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_USER_PK")
            }
            column(name:"USER_TYPE",type:"varchar(30)",remarks: "用户类型")
            column(name:"USER_NAME",type:"varchar(40)",remarks: "用户名"){
                constraints(nullable: "false", unique: "true",uniqueConstraintName: "SYS_USER_U1")
            }
            column(name:"PASSWORD_ENCRYPTED",type:"varchar(80)",remarks: "加密过的密码")
            column(name:"EMAIL",type:"varchar(150)",remarks: "邮箱地址")
            column(name:"PHONE",type:"varchar(40)",remarks: "电话号码")
            column(name:"START_ACTIVE_DATE",type:"datetime",remarks: "有效期从")
            column(name:"END_ACTIVE_DATE",type:"datetime",remarks: "有效期至")
            column(name:"STATUS",type:"varchar(30)",remarks: "状态")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
    }

    changeSet(author: "hailor", id: "20160609-hailor-21") {
        //sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_user_role.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_USER_ROLE_S', startValue:"10001")
        }
        createTable(tableName: "SYS_USER_ROLE"){
            column(name:"SUR_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_USER_ROLE_PK")
            }
            column(name:"USER_ID",type:"bigint",remarks: "用户ID")
            column(name:"ROLE_ID",type:"bigint",remarks: "角色ID")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        addUniqueConstraint(columnNames:"ROLE_ID,USER_ID",tableName:"SYS_USER_ROLE",constraintName: "SYS_USER_ROLE_U1")

    }

    changeSet(author: "jessen", id: "20160610-sys-attach-category-1") {
        //    sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_attach_category.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_ATTACH_CATEGORY_B_S', startValue:"10001")
        }
        createTable(tableName: "SYS_ATTACH_CATEGORY_B"){
            column(name:"CATEGORY_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_ATTACH_CATEGORY_B_PK")
            }
            column(name:"CATEGORY_NAME",type:"varchar(40)")
            column(name:"LEAF_FLAG",type:"varchar(1)")
            column(name:"DESCRIPTION",type:"varchar(240)")
            column(name:"STATUS",type:"varchar(1)")
            column(name:"PARENT_CATEGORY_ID",type:"bigint")
            column(name:"PATH",type:"varchar(200)",remarks: "层级路径")
            column(name:"SOURCE_TYPE",type:"varchar(30)")
            column(name:"ALLOWED_FILE_TYPE",type:"varchar(30)")
            column(name:"ALLOWED_FILE_SIZE",type:"decimal(20,0)")
            column(name:"IS_UNIQUE",type:"varchar(1)")
            column(name:"CATEGORY_PATH",type:"varchar(255)")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }

        createTable(tableName:"SYS_ATTACH_CATEGORY_TL") {
            column(name: "CATEGORY_ID", type: "bigint", remarks: "角色ID") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "LANG", type: "varchar(10)", remarks: "语言") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "CATEGORY_NAME", type: "varchar(40)", remarks: "类别名称")
            column(name: "DESCRIPTION", type: "varchar(240)", remarks: "角色描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue: "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue: "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue: "-1")
            column(name: "ATTRIBUTE_CATEGORY", type: "varchar(30)")
            column(name: "ATTRIBUTE1", type: "varchar(240)")
            column(name: "ATTRIBUTE2", type: "varchar(240)")
            column(name: "ATTRIBUTE3", type: "varchar(240)")
            column(name: "ATTRIBUTE4", type: "varchar(240)")
            column(name: "ATTRIBUTE5", type: "varchar(240)")
            column(name: "ATTRIBUTE6", type: "varchar(240)")
            column(name: "ATTRIBUTE7", type: "varchar(240)")
            column(name: "ATTRIBUTE8", type: "varchar(240)")
            column(name: "ATTRIBUTE9", type: "varchar(240)")
            column(name: "ATTRIBUTE10", type: "varchar(240)")
            column(name: "ATTRIBUTE11", type: "varchar(240)")
            column(name: "ATTRIBUTE12", type: "varchar(240)")
            column(name: "ATTRIBUTE13", type: "varchar(240)")
            column(name: "ATTRIBUTE14", type: "varchar(240)")
            column(name: "ATTRIBUTE15", type: "varchar(240)")
        }
    }

    changeSet(author: "jessen", id: "20160610-sys-attachment-1") {
        //     sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_attachment.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_ATTACHMENT_S', startValue:"10001")
        }
        createTable(tableName: "SYS_ATTACHMENT"){
            column(name:"ATTACHMENT_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_ATTACHMENT_PK")
            }
            column(name:"CATEGORY_ID",type:"bigint",remarks: "分类ID")
            column(name:"NAME",type:"varchar(40)",remarks: "附件名称")
            column(name:"SOURCE_TYPE",type:"varchar(30)",remarks: "对应业务类型")
            column(name:"SOURCE_KEY",type:"varchar(40)",remarks: "业务主键")
            column(name:"STATUS",type:"varchar(1)",remarks: "状态")
            column(name:"START_ACTIVE_DATE",type:"datetime",remarks: "开始生效日期")
            column(name:"END_ACTIVE_DATE",type:"datetime",remarks: "失效时间")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        createIndex(tableName:"SYS_ATTACHMENT",indexName:"SYS_ATTACHMENT_N1"){column(name: "CATEGORY_ID",type: "bigint")}
        createIndex(tableName:"SYS_ATTACHMENT",indexName:"SYS_ATTACHMENT_N2"){
            column(name: "SOURCE_TYPE",type: "varchar(30)")
            column(name:"SOURCE_KEY",type: "varchar(40)")
        }
    }

    changeSet(author: "jessen", id: "20160610-sys-file-1") {
        //    sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_file.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_FILE_S', startValue:"10001")
        }
        createTable(tableName: "SYS_FILE"){
            column(name:"FILE_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_FILE_PK")
            }
            column(name:"ATTACHMENT_ID",type:"bigint",remarks: "附件ID")
            column(name:"FILE_NAME",type:"varchar(255)",remarks: "文件名")
            column(name:"FILE_PATH",type:"varchar(255)",remarks: "文件虚拟路径")
            column(name:"FILE_SIZE",type:"decimal(20,0)",remarks: "文件大小")
            column(name:"FILE_TYPE",type:"varchar(240)",remarks: "文件类型")
            column(name:"UPLOAD_DATE",type:"datetime",remarks: "上传时间")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        createIndex(tableName:"SYS_FILE",indexName:"SYS_FILE_N1"){column(name: "ATTACHMENT_ID",type: "bigint")}

    }

    changeSet(author: "jessen", id: "20160611-sys-message-transaction-1") {
        // sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_message_transaction.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_MESSAGE_TRANSACTION_S', startValue:"10001")
        }
        createTable(tableName: "SYS_MESSAGE_TRANSACTION"){
            column(name:"TRANSACTION_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_MESSAGE_TRANSACTION_PK")
            }
            column(name:"MESSAGE_ID",type:"bigint",remarks: "消息id")
            column(name:"TRANSACTION_STATUS",type:"varchar(25)",remarks: "发送状态")
            column(name:"TRANSACTION_MESSAGE",type:"clob",remarks: "返回信息")
            column(name:"MESSAGE_ADDRESS",type:"varchar(255)",remarks: "消息地址,邮箱/手机号/会员/用户")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        createIndex(tableName:"SYS_MESSAGE_TRANSACTION",indexName:"SYS_MESSAGE_TRANSACTION_N1"){column(name: "MESSAGE_ID",type: "bigint")}
        createIndex(tableName:"SYS_MESSAGE_TRANSACTION",indexName:"SYS_MESSAGE_TRANSACTION_N2"){column(name: "TRANSACTION_STATUS",type: "varchar(25)")}

    }

    changeSet(author: "jessen", id: "20160611-sys-message-attachment-1") {
        //    sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_message_attachment.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_MESSAGE_ATTACHMENT_S', startValue:"10001")
        }
        createTable(tableName: "SYS_MESSAGE_ATTACHMENT"){
            column(name:"ATTACHMENT_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_MESSAGE_ATTACHMENT_PK")
            }
            column(name:"MESSAGE_ID",type:"bigint",remarks: "消息id")
            column(name:"FILE_ID",type:"bigint",remarks: "附件id")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        createIndex(tableName:"SYS_MESSAGE_ATTACHMENT",indexName:"SYS_MESSAGE_ATTACHMENT_N1"){column(name: "FILE_ID",type: "bigint")}
        createIndex(tableName:"SYS_MESSAGE_ATTACHMENT",indexName:"SYS_MESSAGE_ATTACHMENT_N2"){column(name: "MESSAGE_ID",type: "bigint")}

    }

    changeSet(author: "jessen", id: "20160611-sys-message-email-account-1") {
        //     sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_message_email_account.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_MESSAGE_EMAIL_ACCOUNT_S', startValue:"10001")
        }
        createTable(tableName: "SYS_MESSAGE_EMAIL_ACCOUNT"){
            column(name:"ACCOUNT_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_MESSAGE_EMAIL_ACCOUNT_PK")
            }
            column(name:"ACCOUNT_CODE",type:"varchar(50)"){
                constraints(nullable: "false",unique: "true", uniqueConstraintName: "SYS_MESSAGE_EMAIL_ACCOUNT_U1")
            }
            column(name:"CONFIG_ID",type:"bigint")
            column(name:"USER_NAME",type:"varchar(240)")
            column(name:"PASSWORD",type:"varchar(240)")
            column(name:"DESCRIPTION",type:"varchar(240)")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }

    }

    changeSet(author: "jessen", id: "20160611-sys-message-email-config-1") {
        //    sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_message_email_config.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_MESSAGE_EMAIL_CONFIG_S', startValue:"10001")
        }
        createTable(tableName: "SYS_MESSAGE_EMAIL_CONFIG"){
            column(name:"CONFIG_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_MESSAGE_EMAIL_CONFIG_PK")
            }
            column(name:"CONFIG_CODE",type:"varchar(50)",remarks: "编号"){
                constraints(nullable: "false",unique: "true", uniqueConstraintName: "SYS_MESSAGE_EMAIL_CONFIG_U1")
            }
            column(name:"HOST",type:"varchar(50)",remarks: "服务器")
            column(name:"PORT",type:"varchar(10)",remarks: "端口")
            column(name:"TRY_TIMES",type:"decimal(20,0)",defaultValue: "3", remarks: "重试次数")
            column(name:"DESCRIPTION",type:"varchar(20)",remarks: "描述")
            column(name:"USE_WHITE_LIST",type:"varchar(1)",defaultValue: "N", remarks: "是否使用白名单")
            column(name:"USER_NAME",type:"varchar(240)",remarks: "用户名")
            column(name:"PASSWORD",type:"varchar(240)",remarks: "密码")
            column(name:"ENABLE",type:"varchar(1)",defaultValue: "N")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
    }

    changeSet(author: "jessen", id: "20160613-sys-message-email-white-lt-1") {
        //    sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_message_email_white_lt.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_MESSAGE_EMAIL_WHITE_LT_S', startValue:"10001")
        }
        createTable(tableName: "SYS_MESSAGE_EMAIL_WHITE_LT"){
            column(name:"ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_MESSAGE_EMAIL_WHITE_LT_PK")
            }
            column(name:"ADDRESS",type:"varchar(240)",remarks: "白名单地址")
            column(name:"CONFIG_ID",type:"bigint",remarks: "邮箱配置id")
            column(name:"DESCRIPTION",type:"varchar(240)",remarks: "描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
    }

    changeSet(author: "jessen", id: "20160613-sys-message-receiver-1") {
        //     sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_message_receiver.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_MESSAGE_RECEIVER_S', startValue:"10001")
        }
        createTable(tableName: "SYS_MESSAGE_RECEIVER"){
            column(name:"RECEIVER_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_MESSAGE_RECEIVER_PK")
            }
            column(name:"MESSAGE_ID",type:"bigint",remarks: "消息id")
            column(name:"MESSAGE_TYPE",type:"varchar(25)",remarks: "消息类型,抄送/普通")
            column(name:"MESSAGE_ADDRESS",type:"varchar(255)",remarks: "消息地址,邮箱/手机号")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        createIndex(tableName:"SYS_MESSAGE_RECEIVER",indexName:"SYS_MESSAGE_RECEIVER_N1"){column(name: "MESSAGE_ID",type: "bigint")}

    }

    changeSet(author: "jessen", id: "20160613-sys-message-template-1") {
        //sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_message_template.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_MESSAGE_TEMPLATE_S', startValue:"10001")
        }
        createTable(tableName: "SYS_MESSAGE_TEMPLATE"){
            column(name:"TEMPLATE_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_MESSAGE_TEMPLATE_PK")
            }
            column(name:"SUBJECT",type:"clob",remarks: "模板标题")
            column(name:"CONTENT",type:"clob",remarks: "模板内容")
            column(name:"ACCOUNT_ID",type:"bigint",remarks: "账号id")
            column(name:"TEMPLATE_CODE",type:"varchar(50)",remarks: "模板编号"){
                constraints(nullable: "false",unique: "true",uniqueConstraintName: "SYS_MESSAGE_TEMPLATE_U1")
            }
            column(name:"TEMPLATE_TYPE",type:"varchar(50)",remarks: "模板类型,邮件/SMS")
            column(name:"PRIORITY_LEVEL",type:"varchar(50)",remarks: "优先级")
            column(name:"DESCRIPTION",type:"varchar(240)",remarks: "描述")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
    }

    changeSet(author: "jessen", id: "20160613-sys-preferences-1") {
        //    sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_preferences.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_PREFERENCES_S', startValue:"10001")
        }
        createTable(tableName: "SYS_PREFERENCES"){
            column(name:"PREFERENCES_ID",type:"bigint",autoIncrement: "true", startWith:"10001",remarks: "表ID，主键"){
                constraints(nullable: "false", primaryKey: "true",primaryKeyName: "SYS_PREFERENCES_PK")
            }
            column(name:"PREFERENCES",type:"varchar(30)",remarks: "首选项名")
            column(name:"PREFERENCES_VALUE",type:"varchar(80)",remarks: "首选项值")
            column(name:"USER_ID",type:"bigint",remarks: "账号ID")
            column(name:"OBJECT_VERSION_NUMBER",type:"BIGINT",defaultValue: "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue : "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue : "-1")
            column(name:"ATTRIBUTE_CATEGORY",type:"varchar(30)")
            column(name:"ATTRIBUTE1",type:"varchar(240)")
            column(name:"ATTRIBUTE2",type:"varchar(240)")
            column(name:"ATTRIBUTE3",type:"varchar(240)")
            column(name:"ATTRIBUTE4",type:"varchar(240)")
            column(name:"ATTRIBUTE5",type:"varchar(240)")
            column(name:"ATTRIBUTE6",type:"varchar(240)")
            column(name:"ATTRIBUTE7",type:"varchar(240)")
            column(name:"ATTRIBUTE8",type:"varchar(240)")
            column(name:"ATTRIBUTE9",type:"varchar(240)")
            column(name:"ATTRIBUTE10",type:"varchar(240)")
            column(name:"ATTRIBUTE11",type:"varchar(240)")
            column(name:"ATTRIBUTE12",type:"varchar(240)")
            column(name:"ATTRIBUTE13",type:"varchar(240)")
            column(name:"ATTRIBUTE14",type:"varchar(240)")
            column(name:"ATTRIBUTE15",type:"varchar(240)")
        }
        addUniqueConstraint(tableName: "SYS_PREFERENCES",columnNames: "PREFERENCES,USER_ID",constraintName: "SYS_PREFERENCES_U1")
    }

    changeSet(author: "jessen", id: "20160613-sys-account-retrieve-1") {
        //    sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_account_retrieve.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_ACCOUNT_RETRIEVE_S', startValue:"10001")
        }
        createTable(tableName: "SYS_ACCOUNT_RETRIEVE") {
            column(name: "USER_ID", type: "bigint", autoIncrement: "true", startWith: "10001", remarks: "表ID，主键") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "SYS_ACCOUNT_RETRIEVE_PK")
            }
            column(name: "RETRIEVE_TYPE", type: "varchar(30)", remarks: "类型:NAME/PWD")
            column(name: "RETRIEVE_DATE", type: "datetime", remarks: "时间")
            column(name: "OBJECT_VERSION_NUMBER", type: "BIGINT", defaultValue : "1")
            column(name: "REQUEST_ID", type: "bigint", defaultValue: "-1")
            column(name: "PROGRAM_ID", type: "bigint", defaultValue: "-1")
            column(name: "CREATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "CREATION_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "bigint", defaultValue: "-1")
            column(name: "LAST_UPDATE_DATE", type: "datetime", defaultValueComputed: "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "bigint", defaultValue: "-1")
        }
    }

    changeSet(author: "xuhailin", id: "20160922-sys-config-1") {
        //      sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/sys_config.sql"), encoding: "UTF-8")
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_CONFIG_S',startValue:"10001")
        }
        createTable(tableName:"SYS_CONFIG"){
            column(autoIncrement: "true",startWith: "10001", name: "CONFIG_ID", type: "BIGINT", remarks: "pk") {
                constraints(nullable: "false", primaryKey: "true",primaryKeyName:"SYS_CONFIG_PK")
            }
            column(name:"CONFIG_CODE",type:"VARCHAR(240)",remarks: "配置编码"){
                constraints(nullable: "false",unique:"true",uniqueConstraintName:"SYS_CONFIG_U1")
            }
            column(name:"CONFIG_VALUE",type:"VARCHAR(240)",remarks: "配置值")
            column(name:"CATEGORY",type:"VARCHAR(240)",remarks: "配置分类")
            column(name:"ENABLED_FLAG",type:"VARCHAR(1)",remarks: "启用标记",defaultValue : "Y")
            column(name: "OBJECT_VERSION_NUMBER", type: "BIGINT", defaultValue : "1")
            column(name: "REQUEST_ID", type: "BIGINT", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "BIGINT", defaultValue : "-1")
            column(name: "CREATED_BY", type: "BIGINT", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "DATETIME", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "BIGINT", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "DATETIME", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "BIGINT", defaultValue : "-1")

        }
    }

    changeSet(author: "jessen", id: "20160926-activiti.create.engine-1") {
        sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/activiti.create.engine.sql"), encoding: "UTF-8")
    }

    changeSet(author: "jessen", id: "20160926-activiti.create.history-1") {
        sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/activiti.create.history.sql"), encoding: "UTF-8")
    }

    changeSet(author: "jessen", id: "20160926-activiti.create.identity-1") {
        sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/tables/activiti.create.identity.sql"), encoding: "UTF-8")
    }

    changeSet(author: "jialongzuo",id:"2016-10-9-FND_COMPANY"){
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'FND_COMPANY_B_S',startValue:"10001")
        }
        createTable(tableName:"FND_COMPANY_B"){
            column(autoIncrement: "true",startWith: "10001", name: "company_id", type: "BIGINT", remarks: "pk") {
                constraints(nullable: "false", primaryKey: "true",primaryKeyName:"FND_COMPANY_B_PK")
            }
            column(name:"company_code",type:"VARCHAR(30)",remarks: "公司编码"){
                constraints(nullable: "false",unique:"true",uniqueConstraintName:"FND_COMPANY_B_U1")
            }
            column(name:"company_type",type:"VARCHAR(30)",remarks: "公司类型")
            column(name:"address",type:"VARCHAR(2000)",remarks: "地址")
            column(name:"company_level_id",type:"BIGINT")
            column(name:"parent_company_id",type:"BIGINT")
            column(name:"chief_position_id",type:"BIGINT")
            column(name:"start_date_active",type:"DATETIME")
            column(name:"end_date_active",type:"DATETIME")
            column(name:"company_short_name",type:"VARCHAR(2000)",remarks: "公司简称")
            column(name:"company_full_name",type:"VARCHAR(2000)",remarks: "公司全称")
            column(name:"zipcode",type:"VARCHAR(100)")
            column(name:"fax",type:"VARCHAR(100)")
            column(name:"phone",type:"VARCHAR(100)")
            column(name:"contact_person",type:"VARCHAR(100)")
            column(name: "OBJECT_VERSION_NUMBER", type: "BIGINT", defaultValue : "1")
            column(name: "REQUEST_ID", type: "BIGINT", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "BIGINT", defaultValue : "-1")
            column(name: "CREATED_BY", type: "BIGINT", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "DATETIME", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "BIGINT", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "DATETIME", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "BIGINT", defaultValue : "-1")
        }

        createTable(tableName:"FND_COMPANY_TL") {
            column(name: "company_id", type: "bigint", remarks: "公司ID") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "LANG", type: "varchar(10)", remarks: "语言") {
                constraints(nullable: "false", primaryKey: "true")
            }
            column(name: "company_short_name", type: "varchar(2000)")
            column(name: "company_full_name", type: "varchar(2000)")
            column(name: "OBJECT_VERSION_NUMBER", type: "BIGINT", defaultValue : "1")
            column(name: "REQUEST_ID", type: "BIGINT", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "BIGINT", defaultValue : "-1")
            column(name: "CREATED_BY", type: "BIGINT", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "DATETIME", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "BIGINT", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "DATETIME", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "BIGINT", defaultValue : "-1")
        }

    }

    changeSet(author: "jialongzuo", id: "20161011-sys-userLogin-1") {
        if(mhi.isDbType('oracle')){
            createSequence(sequenceName: 'SYS_USER_LOGIN_S',startValue:"10001")
        }
        createTable(tableName:"SYS_USER_LOGIN"){
            column(autoIncrement: "true",startWith: "10001", name: "login_id", type: "BIGINT", remarks: "pk") {
                constraints(nullable: "false", primaryKey: "true",primaryKeyName:"SYS_USER_LOGIN_PK")
            }
            column(name:"user_id",type:"BIGINT",remarks: "用户id"){
                constraints(nullable: "false")
            }
            column(name:"login_time",type:"DATETIME",remarks: "登录时间")
            column(name:"ip",type:"VARCHAR(40)",remarks: "ip地址")
            column(name:"referer",type:"VARCHAR(240)")
            column(name:"user_agent",type:"VARCHAR(240)")
            column(name: "OBJECT_VERSION_NUMBER", type: "BIGINT", defaultValue : "1")
            column(name: "REQUEST_ID", type: "BIGINT", defaultValue : "-1")
            column(name: "PROGRAM_ID", type: "BIGINT", defaultValue : "-1")
            column(name: "CREATED_BY", type: "BIGINT", defaultValue : "-1")
            column(name: "CREATION_DATE", type: "DATETIME", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATED_BY", type: "BIGINT", defaultValue : "-1")
            column(name: "LAST_UPDATE_DATE", type: "DATETIME", defaultValueComputed : "CURRENT_TIMESTAMP")
            column(name: "LAST_UPDATE_LOGIN", type: "BIGINT", defaultValue : "-1")

        }
    }

}
