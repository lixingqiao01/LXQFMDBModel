//
//  ViewController.m
//  FMDBModel
//
//  Created by lixingqiao01@163.com on 2017/6/15.
//  Copyright © 2017年 LXQ.inc. All rights reserved.
//

#import "ViewController.h"
#import "LXQFMDBModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LXQFMDBModel *model = [[LXQFMDBModel alloc]initWithPath:@"/Users/lixingqiao01/Desktop" fileName:@"tmp.sqlite"];
//    [model createTableName:@"temp1" maker:^(LXQFMDBMaker *maker) {
//        maker.columnName(@"id").integer().primaryKey().autoincrement().notNull();
//        maker.columnName(@"name").text().notNull();
//        maker.columnName(@"age").text().notNull();
//        maker.create();
//    }];
    
//    [model insertIntoTableName:@"temp1" maker:^(LXQFMDBMaker *maker) {
//        maker.columnName(@"name").values(@"Lixingqiao");
//        maker.columnName(@"age").values(@24);
//        maker.insert();
//    }];
    [model selectFromTableName:@"temp1" maker:^(LXQFMDBMaker *maker) {
        maker.columnName(@"name");
        maker.where(@"name").equalTo(@"Lixingqiao").OR().where(@"age").greateThanOrEqualTo(@"24");
        maker.select();
    }];
    [model selectFromTableName:@"temp1" maker:^(LXQFMDBMaker *maker) {
        maker.columnName(@"name");
        maker.where(@"name").equalTo(@"Lixingqiao").OR().where(@"age").greateThanOrEqualTo(@"24");
        maker.select();
    } resultSet:^(FMResultSet *set) {
        while ([set next]) {
            //相关操作
        }
    }];
    
//    [model deleteFromTableName:@"temp" maker:^(LXQFMDBMaker *maker) {
//        maker.where(@"name").equalTo(@"Lixingqiao");
//        maker.Delete();
//    }];
//    [model updateWithTableName:@"temp1" maker:^(LXQFMDBMaker *maker) {
//        maker.set(@"name").assignment(@"liujing");
//        maker.where(@"age").equalTo(@"24");
//        maker.update();
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
