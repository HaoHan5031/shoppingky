//
//  KYTabbarViewController.h
//  shopky
//
//  Created by HaoMac on 2018/8/23.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM (NSInteger, KYTabbarControllerType){
    KYTabbarControllerHomeType = 0,
    KYTabbarControllerCarType = 1,
    KYTabbarControllerCaegotyType = 2,
    KYTabbarControllerMyType = 3
};


@interface KYTabbarController : UITabBarController

@property(assign , nonatomic) KYTabbarControllerType KYTabbarType;

@end
