//
//  LXQFMDBMaker.h
//  FMDBModel
//
//  Created by lixingqiao01@163.com on 2017/6/15.
//  Copyright © 2017年 LXQ.inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

typedef void(^FMResultSetBlock)(FMResultSet *);
@interface LXQFMDBMaker : NSObject

@property (nonatomic, copy)         NSString        *sql;
@property (nonatomic, strong)       FMDatabase      *db;
@property (nonatomic, copy)         NSString        *tableName;
@property (nonatomic, assign)       FMResultSetBlock    resultBlock;

#pragma mark - 三种基本数据格式
- (LXQFMDBMaker *(^)())integer;
- (LXQFMDBMaker *(^)())text;
- (LXQFMDBMaker *(^)())blob;

#pragma mark - 列属性
- (LXQFMDBMaker *(^)())primaryKey;
- (LXQFMDBMaker *(^)())autoincrement;
- (LXQFMDBMaker *(^)())notNull;

#pragma mark - 逻辑操作
- (LXQFMDBMaker *(^)(NSString *))where;
- (LXQFMDBMaker *(^)())AND;
- (LXQFMDBMaker *(^)())OR;

- (LXQFMDBMaker *(^)(id))greateThan;
- (LXQFMDBMaker *(^)(id))greateThanOrEqualTo;
- (LXQFMDBMaker *(^)(id))equalTo;
- (LXQFMDBMaker *(^)(id))lessThan;
- (LXQFMDBMaker *(^)(id))lessThanOrEqualTo;
/**
 打印sqlite语句
 */
- (LXQFMDBMaker *(^)())SQLOG;
/**
 列属性
 */
- (LXQFMDBMaker *(^)(NSString *))columnName;
/**
 创建表
 */
- (LXQFMDBMaker *(^)())create;
- (LXQFMDBMaker *(^)(id))values;
- (LXQFMDBMaker *(^)())insert;
- (LXQFMDBMaker *(^)())select;

- (LXQFMDBMaker *(^)())Delete;
@end
