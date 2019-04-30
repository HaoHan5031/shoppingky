//
//  bottomAddShoppingCarView.h
//  shopky
//
//  Created by HaoMac on 2019/3/15.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^balanceAction)();

@interface bottomAddShoppingCarView : UIView
@property(nonatomic, strong)UIImageView* logoImg;
@property(nonatomic, strong)UILabel* favourableLab; //y优惠券
@property(nonatomic, strong)UILabel* countMoneyLab; //价钱
@property(nonatomic, strong)UILabel* sendMoneyLab;
@property(nonatomic, strong)UIButton* balanceBtn;
@property(nonatomic, strong)UILabel* noticeLab;
@property(nonatomic, assign)NSInteger Countnum;
@property(nonatomic, copy)balanceAction balance_action;
-(void)setbageNum:(NSInteger)num;
-(void)setaddbageNum:(NSInteger)num;
-(void)setdelbageNum:(NSInteger)num;
@end

NS_ASSUME_NONNULL_END
