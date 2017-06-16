1. **封装目的**

​	在学习FMDB的过程中，总是记不住数据库相关操作的代码，而且觉得FMDB的一些操作过于复杂，于是萌生出自己封装一个FMDB数据的想法，在最初的时候想创建一个model，然后这个model自动创建table，但是在实际操作中出现了很多的问题，于是放弃第一个版本的想法。在一次做页面布局的时候发现masonry的布局方式很特别，于是开始查看masonry源码，在学习当中明白masonry使用的是链式编程思想，突然一下灵光闪现，为什么我不能用同样的方法来写我自己的FMDB模型呢？于是乎开始了自己的尝试，完成后的效果自己还是比较满意的。

**2. 当前版本支持的数据类型**

> integer： 32 位元的整数
>
> text：字符串类型
>
> blob：二进制数据类型

#### LXQFMDBModel的使用

* 创建数据库

```objective-c
LXQFMDBModel *model = [[LXQFMDBModel alloc]initWithPath:path fileName:sqliteName];
```

> path:数据库保存地址
>
> sqliteName:数据库名称

- 创建表格

```ob
[model createTableName:@"temp1" maker:^(LXQFMDBMaker *maker) {
        maker.columnName(@"id").integer().primaryKey().autoincrement().notNull();
        maker.columnName(@"name").text().notNull();
        maker.columnName(@"age").text().notNull();
        maker.create();
    }];
```

* 插入数据

```objective-c
[model insertIntoTableName:@"temp1" maker:^(LXQFMDBMaker *maker) {
        maker.columnName(@"name").values(@"Lixingqiao");
        maker.columnName(@"age").values(@24);
        maker.insert();
    }];
```

* 删除数据

```objective-c
[model deleteFromTableName:@"temp" maker:^(LXQFMDBMaker *maker) {
        maker.where(@"name").equalTo(@"Lixingqiao");
        maker.Delete();
    }];
```

* 修改数据

```objective-c
[model updateWithTableName:@"temp1" maker:^(LXQFMDBMaker *maker) {
        maker.set(@"name").assignment(@"liujing");
        maker.where(@"age").equalTo(@"24");
        maker.update();
    }];
```

* 查询数据

```objective-c
[model selectFromTableName:@"temp1" maker:^(LXQFMDBMaker *maker) {
        maker.columnName(@"name");
 maker.where(@"name").equalTo(@"Lixingqiao").OR().where(@"age").greateThanOrEqualTo(@"24");
        maker.select();
    }];
```

#### 后记

​	当前版本还不完善，后期会加上各项数据库的操作代码，以及解决数据库线程安全的问题，等待后续更新，当然也希望各位大神多多指点一二，也热烈欢迎各位将你们的建议或者在使用中发现的问题email给我，

邮箱：lixingqiao01@163.com

