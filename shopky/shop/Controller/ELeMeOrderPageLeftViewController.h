//
//  ELeMeOrderPageLeftViewController.h
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderFoodModel.h"

typedef void(^leftCellSelectBlock)(NSInteger shopNumChange);
typedef void(^setBottomViewCount)(NSInteger num);
@interface ELeMeOrderPageLeftViewController : UIViewController
@property(nonatomic, strong,readonly)LWGesturePenetrationTableView *rightTableView;
@property (nonatomic, assign) OffsetType offsetType;
@property (nonatomic, strong)OrderFoodModel *orderFoodModel;
@property(nonatomic, assign) BOOL rightTVScrollDown;
@property(nonatomic, copy)leftCellSelectBlock cellSelectBlock;
@property(nonatomic, copy)setBottomViewCount setBottomCount;

@property(nonatomic, strong)NSString* shopID;
@property(nonatomic, strong)NSString* shopName;
@end
