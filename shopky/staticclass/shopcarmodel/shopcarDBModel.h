//
//  shopcarDBModel.h
//  shopky
//
//  Created by HaoMac on 2019/3/27.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface shopcarDBModel : NSObject
@property (nonatomic, assign)NSString* shopId;
@property (nonatomic, assign)NSString* goodsId;
@property (nonatomic, strong)NSString* shopName;
@property (nonatomic, strong)NSString* goodsName;
@property (nonatomic, assign)int count;
@property (nonatomic, strong)NSString* price;
@end

NS_ASSUME_NONNULL_END
