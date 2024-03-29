package com.hand.hap.db

import com.hand.hap.liquibase.MigrationHelper
import com.hand.hap.db.excel.ExcelDataLoader
dbType = MigrationHelper.getInstance().dbType()
databaseChangeLog(logicalFilePath:"2016-06-09-init-data-migration.groovy"){

    changeSet(author: "jessen", id: "20160613-data-sys-attach-category-1") {
        sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/init/sys_attach_category.sql"), encoding: "UTF-8")
    }

    changeSet(author: "jessen", id: "20160613-data-sys-message-email-config-1") {
        sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/init/sys_message_email_config.sql"), encoding: "UTF-8")
    }

    changeSet(author: "jessen", id: "20160613-data-sys-message-email-account-1") {
        sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/init/sys_message_email_account.sql"), encoding: "UTF-8")
    }

    changeSet(author: "jessen", id: "20160613-data-sys-message-email-white-lt-1") {
        sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/init/sys_message_email_white_lt.sql"), encoding: "UTF-8")
    }

    changeSet(author: "jessen", id: "20160613-data-sys-message-template-1") {
        sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/init/sys_message_template.sql"), encoding: "UTF-8")
    }

    //Milestone , excel data, runAlways=true
    changeSet(author: "jessen", id: "20160930-init-data-xlsx", runAlways:"true"){
        customChange(class:ExcelDataLoader.class.name){
            param(name:"filePath",value:MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/2016-09-30-init-data.xlsx"))
        }
    }
}
