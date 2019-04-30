//
//  goodDetialViewController.h
//  shopky
//
//  Created by HaoMac on 2019/3/14.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodDetialViewController : UIViewController
@property(nonatomic, strong)UIViewController* perantVC;
@property(nonatomic, assign)int goodID;
@property(nonatomic, strong)NSString* shopID;

@end

NS_ASSUME_NONNULL_END
