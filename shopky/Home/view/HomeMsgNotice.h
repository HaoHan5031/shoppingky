//
//  HomeMsgNotice.h
//  shopky
//
//  Created by HaoMac on 2018/8/30.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DCTitleRolling.h"

@interface HomeMsgNotice : UIView<CDDRollingDelegate>
@property(nonatomic, strong) UIImageView* imageGif;
@property(nonatomic, strong) DCTitleRolling* dcTittleRoll;
@property(nonatomic, strong) NSDictionary* dicMsg;
-(void)setData:(NSDictionary*)dic;
@end
