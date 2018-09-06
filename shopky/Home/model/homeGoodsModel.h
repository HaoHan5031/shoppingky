//
//  goodsModel.h
//  shopky
//
//  Created by HaoMac on 2018/9/2.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface homeGoodsModel : BaseModel

@property(nonatomic, strong)NSString* imageurl;
@property(nonatomic, strong)NSString* goodid;
@property(nonatomic, assign)int tag;
@property(nonatomic, assign)int counts;
@property(nonatomic, assign)float price;
@end
