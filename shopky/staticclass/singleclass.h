//
//  singleclass.h
//  shopky
//
//  Created by HaoMac on 2019/2/22.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "shopcarDBModel.h"
#import "shopCarListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject

@property (nonatomic, retain, readonly) FMDatabaseQueue *dbqueue;

+(instancetype) shareInstance ;

-(void)createDB:(NSString*) strDBName;
-(void)createTbale:(NSString* )strtTableName;
-(NSMutableArray*)getAllInfo;
-(NSMutableArray*)getShopCarGoodsInfo:(NSString*)shopid;
-(shopcarDBModel*)getOneGoodsInfo:(NSString*)shopid goodsid:(NSString*)goodsid;
//-(addressModel* )getAddressInfo;
-(BOOL)insertGoodsData:(shopcarDBModel* )model;
-(BOOL)updateGoodsData:(shopcarDBModel* )oldModel newModel:(shopcarDBModel* )newModel;
-(BOOL)deleteGoodsData:(shopcarDBModel* )model;
-(BOOL)deleteALLGoods:(shopcarDBModel* )model;
-(BOOL)queryGoodsInfo:(shopcarDBModel* )model;
-(NSMutableArray*)queryShopCarInfo;
@end

NS_ASSUME_NONNULL_END
