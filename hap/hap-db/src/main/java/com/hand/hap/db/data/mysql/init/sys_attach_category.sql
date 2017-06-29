INSERT INTO SYS_ATTACH_CATEGORY_B(`CATEGORY_ID`,`CATEGORY_NAME`,`LEAF_FLAG`,`DESCRIPTION`,`STATUS`,`PARENT_CATEGORY_ID`,`PATH`,`SOURCE_TYPE`,`ALLOWED_FILE_TYPE`,`ALLOWED_FILE_SIZE`,`CATEGORY_PATH`,`IS_UNIQUE`)VALUES(1,'目录1','0','目录1','1',-1,'1','FOLDER',null,null,null,'Y');
INSERT INTO SYS_ATTACH_CATEGORY_B(`CATEGORY_ID`,`CATEGORY_NAME`,`LEAF_FLAG`,`DESCRIPTION`,`STATUS`,`PARENT_CATEGORY_ID`,`PATH`,`SOURCE_TYPE`,`ALLOWED_FILE_TYPE`,`ALLOWED_FILE_SIZE`,`CATEGORY_PATH`,`IS_UNIQUE`)VALUES(2,'目录2','0','目录2','1',1,'1.2','FOLDER',null,null,null,'N');
INSERT INTO SYS_ATTACH_CATEGORY_B(`CATEGORY_ID`,`CATEGORY_NAME`,`LEAF_FLAG`,`DESCRIPTION`,`STATUS`,`PARENT_CATEGORY_ID`,`PATH`,`SOURCE_TYPE`,`ALLOWED_FILE_TYPE`,`ALLOWED_FILE_SIZE`,`CATEGORY_PATH`,`IS_UNIQUE`)VALUES(3,'目录3','0','叶节点1','1',2,'1.2.3','IMG',null,null,'/Users/jessen/Pictures/hap/img','Y');
INSERT INTO SYS_ATTACH_CATEGORY_B(`CATEGORY_ID`,`CATEGORY_NAME`,`LEAF_FLAG`,`DESCRIPTION`,`STATUS`,`PARENT_CATEGORY_ID`,`PATH`,`SOURCE_TYPE`,`ALLOWED_FILE_TYPE`,`ALLOWED_FILE_SIZE`,`CATEGORY_PATH`,`IS_UNIQUE`)VALUES(4,'Leaf 1.1','1','Leaf 1.1','1',3,'1.2.3.4','IMG2','.jpg;.jpeg;.png',null,'/Users/jessen/Pictures/hap/img','N');


INSERT INTO SYS_ATTACH_CATEGORY_TL(`CATEGORY_ID`,`CATEGORY_NAME`,`DESCRIPTION`,`LANG`)VALUES(1,'Category1','Category1','en_GB');
INSERT INTO SYS_ATTACH_CATEGORY_TL(`CATEGORY_ID`,`CATEGORY_NAME`,`DESCRIPTION`,`LANG`)VALUES(1,'目录1','目录1','zh_CN');
INSERT INTO SYS_ATTACH_CATEGORY_TL(`CATEGORY_ID`,`CATEGORY_NAME`,`DESCRIPTION`,`LANG`)VALUES(2,'Category2','Category2','en_GB');
INSERT INTO SYS_ATTACH_CATEGORY_TL(`CATEGORY_ID`,`CATEGORY_NAME`,`DESCRIPTION`,`LANG`)VALUES(2,'目录2','目录2','zh_CN');
INSERT INTO SYS_ATTACH_CATEGORY_TL(`CATEGORY_ID`,`CATEGORY_NAME`,`DESCRIPTION`,`LANG`)VALUES(3,'Category3','Left1','en_GB');
INSERT INTO SYS_ATTACH_CATEGORY_TL(`CATEGORY_ID`,`CATEGORY_NAME`,`DESCRIPTION`,`LANG`)VALUES(3,'目录3','叶节点1','zh_CN');
INSERT INTO SYS_ATTACH_CATEGORY_TL(`CATEGORY_ID`,`CATEGORY_NAME`,`DESCRIPTION`,`LANG`)VALUES(4,'Leaf1.1','Leaf 1.1','en_GB');
INSERT INTO SYS_ATTACH_CATEGORY_TL(`CATEGORY_ID`,`CATEGORY_NAME`,`DESCRIPTION`,`LANG`)VALUES(4,'Leaf 1.1','Leaf 1.1','zh_CN');


