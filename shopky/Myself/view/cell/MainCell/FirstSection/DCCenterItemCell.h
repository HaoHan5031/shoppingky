//
//  DCCenterItemCell.h
//  CDDStoreDemo
//
//  Created by hao on 2017/12/12.
//Copyright © 2017年 RocketsChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCCenterItemCell : UIView
@property (nonatomic, copy) void (^orderBtnClickBlock)(int index);

@end
