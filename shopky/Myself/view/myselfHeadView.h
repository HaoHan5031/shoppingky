//
//  myselfHeadView.h
//  shopky
//
//  Created by HaoMac on 2019/2/20.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myselfHeadModel.h"
#import "DCCenterItemCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface myselfHeadView : UIView
@property (nonatomic, strong)UIImageView* imgHeadView;
@property (nonatomic, strong)UILabel* labName;
@property (nonatomic, strong)UILabel* labInfo;

@property (nonatomic, strong)UIButton* btnWaitPay;
@property (nonatomic, strong)UIButton* btnWaitSend;
@property (nonatomic, strong)UIButton* btnWaitRecevie;
@property (nonatomic, strong)UIButton* btnServer;
@property (nonatomic, strong)UIButton* btnAll;

@property (nonatomic, copy)void(^cellSelectBlock)(int index);

@property (nonatomic, strong)DCCenterItemCell* centerView;

@property (nonatomic, strong)myselfHeadModel *model;

-(void)setModel:(NSDictionary* )dic;
@end

NS_ASSUME_NONNULL_END
