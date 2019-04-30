//
//  shopCarListModel.h
//  shopky
//
//  Created by HaoMac on 2019/3/29.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface shopCarListModel : NSObject
@property (nonatomic, assign)int count;
@property (nonatomic, strong)NSString* TotalPrice;
@property (nonatomic, strong)NSString* shopID;
@property (nonatomic, strong)NSString* shooName;
@property (nonatomic, strong)NSMutableArray<shopcarDBModel*>* arrItem;
@end

NS_ASSUME_NONNULL_END
