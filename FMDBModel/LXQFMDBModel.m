//
//  LXQFMDBModel.m
//  FMDBModel
//
//  Created by lixingqiao01@163.com on 2017/6/15.
//  Copyright © 2017年 LXQ.inc. All rights reserved.
//

#import "LXQFMDBModel.h"

@interface LXQFMDBModel ()

@property (nonatomic, strong)   FMDatabase          *db;

@end

@implementation LXQFMDBModel

- (LXQFMDBModel *)initWithPath:(NSString *)path fileName:(NSString *)fileName{
    self = [super init];
    if (self) {
        self.db = [FMDatabase databaseWithPath:[NSString stringWithFormat:@"%@/%@",path,fileName]];
        if (![self.db open]) {
            NSAssert(0, @"数据库打开失败");
        }
    }
    return self;
}

- (void)createTableName:(NSString *)name maker:(void (^)(LXQFMDBMaker *))block{
    LXQFMDBMaker *maker = [[LXQFMDBMaker alloc]init];\
    maker.sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (*)",name];
    maker.tableName = name;
    maker.db = self.db;
    block(maker);
}

- (void)insertIntoTableName:(NSString *)tableName maker:(void (^)(LXQFMDBMaker *))block{
    LXQFMDBMaker *maker = [[LXQFMDBMaker alloc]init];
    maker.sql = [NSString stringWithFormat:@"INSERT INTO '%@' (*) VALUES (?)",tableName];
    maker.tableName = tableName;
    maker.db = self.db;
    block(maker);
}

- (void)selectFromTableName:(NSString *)tableName maker:(void (^)(LXQFMDBMaker *))block{
    LXQFMDBMaker *maker = [[LXQFMDBMaker alloc]init];
    maker.sql = [NSString stringWithFormat:@"SELECT * FROM %@",tableName];
    maker.tableName = tableName;
    maker.db = self.db;
    block(maker);
}

- (void)selectFromTableName:(NSString *)tableName maker:(void (^)(LXQFMDBMaker *))block resultSet:(void (^)(FMResultSet *))setBlock{
    LXQFMDBMaker *maker = [[LXQFMDBMaker alloc]init];
    maker.sql = [NSString stringWithFormat:@"SELECT * FROM %@",tableName];
    maker.tableName = tableName;
    maker.db = self.db;
    maker.resultBlock = setBlock;
    block(maker);
}

- (void)deleteFromTableName:(NSString *)tableName maker:(void (^)(LXQFMDBMaker *))block{
    LXQFMDBMaker *maker = [[LXQFMDBMaker alloc]init];
    maker.sql = [NSString stringWithFormat:@"DELETE FROM %@",tableName];
    maker.db = self.db;
    block(maker);
}
@end
