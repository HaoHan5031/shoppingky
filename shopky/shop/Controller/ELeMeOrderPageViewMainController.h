//
//  ELeMeOrderPageViewController.h
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/10.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELeMeOrderPageViewMainController : UIViewController
@property (nonatomic, strong, readonly) UITableView *mainTableView;
@property(nonatomic, strong)NSString* shopID;
@property (nonatomic, assign) OffsetType offsetType;
-(void)addItemToCar:(NSInteger)num Rect:(CGRect)rect Status:(BOOL) increaseStatus;
@end
