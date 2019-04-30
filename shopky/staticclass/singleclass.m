//
//  singleclass.m
//  shopky
//
//  Created by HaoMac on 2019/2/22.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "singleclass.h"

@interface Singleton ()

@property (nonatomic, retain) FMDatabaseQueue *dbqueue;

@end

@implementation Singleton

static Singleton* _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
        
    }) ;
    
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [Singleton shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [Singleton shareInstance] ;
}

+ (NSString *)dbPathWithDirectoryName:(NSString *)directoryName
{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(@"%@",doc);
    NSString *filPath = [doc stringByAppendingPathComponent:directoryName];
    return filPath;
}

+ (NSString *)dbPath
{
    return [self dbPathWithDirectoryName:@"shopcarDB.sqlite"];
}

- (FMDatabaseQueue *)dbqueue
{
    if (_dbqueue == nil) {
        _dbqueue = [[FMDatabaseQueue alloc] initWithPath:[self.class dbPath]];
    }
    return _dbqueue;
}



-(void)createDB:(NSString *)strDBName
{
    //获取Docment文件路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(@"%@",doc);
    NSString *filPath = [doc stringByAppendingPathComponent:strDBName];
    self.dbqueue = [[FMDatabaseQueue alloc] initWithPath:filPath];
    if (_dbqueue) {
        NSLog(@"创建数据库成功");
        [_dbqueue inDatabase:^(FMDatabase * _Nonnull db){

            NSString* sql = @"CREATE TABLE IF NOT EXISTS shopCarInfo (id integer PRIMARY KEY AUTOINCREMENT,shopid TEXT NOT NULL,shopName TEXT NOT NULL, goodsid TEXT NOT NULL, count integer NOT NULL,  price TEXT NOT NULL, goodsname TEXT NOT NULL)";
            BOOL result = [db executeUpdate:sql];
            if (result) {
                NSLog(@"创建表shopCarInfo成功");
            }else{
                NSLog(@"创建表shopCarInfo失败");
            }
        }];
    }
    else
    {
        NSLog(@"创建数据库失败");
    }

}

-(void)createTbale:(NSString *)strtTableName 
{
//    if ([self.db open]) {
//
//        BOOL result = [self.db executeUpdate:strtTableName];
//        if (result) {
//            NSLog(@"创建成功");
//        }else{
//            NSLog(@"创建失败");
//        }
//        [self.db close];
//    }else{
//        NSLog(@"数据库打开失败");
//    }
    
}

-(NSMutableArray *)queryShopCarInfo
{
    __block NSMutableArray*arr = [[NSMutableArray alloc] init];
    if (_dbqueue) {
        NSLog(@"创建数据库成功");
        
        [_dbqueue inDatabase:^(FMDatabase * _Nonnull db){
            [db open];
            NSString* sql = [NSString stringWithFormat:@"select shopid, shopName, count(shopid) as num, sum(cast(price as numeric(12,2))) as price from shopCarInfo group by shopid"];
            FMResultSet *rs = [db executeQuery:sql];
            
            while ([rs next])
            {
                shopCarListModel *model = [[shopCarListModel alloc] init] ;
                model.shopID = [rs stringForColumn:@"shopid"];
                model.shooName = [rs stringForColumn:@"shopName"];
                model.count = [rs intForColumn:@"num"];
                model.TotalPrice = [rs stringForColumn:@"price"];
                NSString* sqlTemp = [NSString stringWithFormat:@"select * from shopCarInfo where shopid = %@", model.shopID];
                FMResultSet *rsTemp = [db executeQuery:sqlTemp];
                model.arrItem = [[NSMutableArray alloc] init];
                while ([rsTemp next])
                {
                    [model.arrItem addObject:[self rsToModel :rsTemp]];
                }
                [arr addObject:model];
            }
            
            [db close];
        }];
    }
    else
    {
        return nil;
    }
    return arr;
}

-(NSMutableArray*)getShopCarGoodsInfo:(NSString*)shopid
{
    __block NSMutableArray *goodsArr = [[NSMutableArray alloc] init] ;
    if (_dbqueue) {
        NSLog(@"创建数据库成功");
        
        [_dbqueue inDatabase:^(FMDatabase * _Nonnull db){
            [db open];
            NSString* sql = [NSString stringWithFormat:@"select * from shopCarInfo where shopid = %@", shopid];
            FMResultSet *rs = [db executeQuery:sql];
            while ([rs next])
            {
                [goodsArr addObject:[self rsToModel :rs]];
            }
            
            [db close];
        }];
    }
    else
    {
        return nil;
    }
    
    return goodsArr;
}

-(NSMutableArray*)getAllInfo
{
    __block NSMutableArray *goodsArr = [[NSMutableArray alloc] init] ;
    if (_dbqueue) {
        NSLog(@"创建数据库成功");
        
        [_dbqueue inDatabase:^(FMDatabase * _Nonnull db){
            [db open];
            NSString* sql = @"select* from shopCarInfo";
            FMResultSet *rs = [db executeQuery:sql];
            while ([rs next])
            {
                [goodsArr addObject:[self rsToModel :rs]];
            }
            
           [db close];
        }];
    }
    else
    {
        return nil;
    }
    
    return goodsArr;
}

- (shopcarDBModel *)rsToModel:(FMResultSet*)rs
{
    shopcarDBModel *model = [[shopcarDBModel alloc] init] ;
    model.shopId = [rs stringForColumn:@"shopid"];
    model.shopName = [rs stringForColumn:@"shopName"];
    model.goodsId = [rs  stringForColumn:@"goodsId"];
    model.goodsName = [rs stringForColumn:@"goodsName"];
    model.count = [rs intForColumn:@"count"];
    model.price = [rs stringForColumn:@"price"];
    return model;
}

-(BOOL)insertGoodsData:(shopcarDBModel* )model
{
    [_dbqueue inDatabase:^(FMDatabase *db) {
        [db open];
        NSString *sql = @"insert into shopCarInfo (shopid, shopName, goodsid, count, price, goodsname) values (?,?,?,?,?,?)";
        BOOL res = [db executeUpdate:sql,model.shopId, model.shopName, model.goodsId, @(model.count), model.price, model.goodsName];
        if (res) {
            NSLog(@"插入数据成功");
        }
        else
        {
            NSLog(@"插入数据失败");
        }
        if ([db close]) {
            NSLog(@"关闭成功");
        }
        else
        {
            NSLog(@"关闭失败");
        }
    }];
    return TRUE;
}

-(BOOL)updateGoodsData:(shopcarDBModel* )model newModel:(shopcarDBModel* )newModel
{
    [self.dbqueue inDatabase:^(FMDatabase *db) {
        [db open];
        NSString *sql = [NSString stringWithFormat:@"update shopCarInfo set count = %d  where shopid = %@ and goodsid = %@",
                         model.count, model.shopId, model.goodsId];
        
        if([db executeUpdate:sql]){
            NSLog(@"插入数据成功");
        }
        else
        {
            NSLog(@"插入数据失败");
        }
        if ([db close]) {
            NSLog(@"关闭成功");
        }
        else
        {
            NSLog(@"关闭失败");
        }
    }];
    return FALSE;
}

-(BOOL)queryGoodsInfo:(shopcarDBModel* )model
{
    return false;
}

-(shopcarDBModel*)getOneGoodsInfo:(NSString*)shopid goodsid:(NSString*)goodsid
{
    
    __block shopcarDBModel* model = [[shopcarDBModel alloc] init];
    if (_dbqueue) {
        NSLog(@"创建数据库成功");
        
        [_dbqueue inDatabase:^(FMDatabase * _Nonnull db){
            [db open];
            NSString* sql = [NSString stringWithFormat:@"select * from shopCarInfo where shopid=%@ and goodsid=%@", shopid,goodsid];
            FMResultSet *rs = [db executeQuery:sql];
            while ([rs next])
            {
                model = [self rsToModel :rs];
                break;
            }
            
            [db close];
        }];
    }
    else
    {
        return nil;
    }
    
    return model;
}

-(BOOL)deleteGoodsData:(shopcarDBModel *)model
{
    [self.dbqueue inDatabase:^(FMDatabase *db) {
        [db open];
        NSString *sql = [NSString stringWithFormat:@"delete from shopCarInfo where shopid=%@ and goodsid=%@",
                         model.shopId, model.goodsId];
        if([db executeUpdate:sql])
        {
            NSLog(@"删除成功");
        }
        else
        {
            NSLog(@"删除失败");
        }
        if ([db close]) {
            NSLog(@"关闭成功");
        }
        else
        {
            NSLog(@"关闭失败");
        }
    }];
    return TRUE;
}

-(BOOL)deleteALLGoods:(shopcarDBModel* )model
{
    [self.dbqueue inDatabase:^(FMDatabase *db) {
        [db open];
        NSString *sql = [NSString stringWithFormat:@"delete from shopCarInfo where shopid=%@",model.shopId];
        if([db executeUpdate:sql])
        {
            NSLog(@"删除成功");
        }
        else
        {
            NSLog(@"删除失败");
        }
        if ([db close]) {
            NSLog(@"关闭成功");
        }
        else
        {
            NSLog(@"关闭失败");
        }
    }];
    return TRUE;
}

//
//-(addressModel*)getAddressInfo
//{
//    addressModel* model = [[addressModel alloc] init];
//    return model;
//}

@end
