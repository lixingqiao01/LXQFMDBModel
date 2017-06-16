//
//  LXQFMDBModel.h
//  FMDBModel
//
//  Created by lixingqiao01@163.com on 2017/6/15.
//  Copyright © 2017年 LXQ.inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXQFMDBMaker.h"

@interface LXQFMDBModel : NSObject

/**
 初始化对象

 @param path 数据库保存路径
 @param fileName 数据库名称
 @return 返回对象
 */
- (LXQFMDBModel *)initWithPath:(NSString *)path fileName:(NSString *)fileName;

/**
 创建数据库表

 @param name 表名
 @param block 操作对象
 */
- (void)createTableName:(NSString *)name maker:(void(^)(LXQFMDBMaker *maker))block;
/**
 插入数据

 @param tableName 表名
 @param block 操作对象
 */
- (void)insertIntoTableName:(NSString *)tableName maker:(void(^)(LXQFMDBMaker *maker))block;
/**
 查询数据

 @param tableName 查询的表格
 @param block 操作对象
 */
- (void)selectFromTableName:(NSString *)tableName maker:(void(^)(LXQFMDBMaker *maker))block;
- (void)selectFromTableName:(NSString *)tableName maker:(void(^)(LXQFMDBMaker *maker))block resultSet:(void(^)(FMResultSet *set))setBlock;
/**
 删除表中数据
 
 @param tableName 需要删除数据的表名
 @param block 操作对象
 */
- (void)deleteFromTableName:(NSString *)tableName maker:(void(^)(LXQFMDBMaker *maker))block;
@end
