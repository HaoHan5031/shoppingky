//
//  bottomAddShoppingCarView.m
//  shopky
//
//  Created by HaoMac on 2019/3/15.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "bottomAddShoppingCarView.h"
#import "PPBadgeView.h"

@implementation bottomAddShoppingCarView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnView];
        _Countnum = 0;
    }
    return self;
}

-(void)addOwnView
{
    _noticeLab = [[UILabel alloc] init];
    _noticeLab.font = [UIFont systemFontOfSize:10];
    _noticeLab.textAlignment = NSTextAlignmentCenter;
    _noticeLab.text = @"全店满35减5元";
    [_noticeLab sizeToFit];
    [self addSubview:_noticeLab];
    [_noticeLab makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(5);
        make.centerX.equalTo(self);
    }];
    
    UIView* bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor blackColor];
    [self addSubview:bottomView];
    [bottomView makeConstraints:^(MASConstraintMaker* make){
        
        make.bottom.equalTo(self.bottom);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(80);
        make.centerX.equalTo(self);
        
    }];
    
    _logoImg = [[UIImageView alloc] init];
    _logoImg.contentMode = UIViewContentModeScaleAspectFit;
    [_logoImg setImage:[UIImage imageNamed:@"logoshop"]];
    [self addSubview:_logoImg];
    [_logoImg makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(10);
        make.bottom.equalTo(self.bottom).equalTo(-5);
        make.width.equalTo(80);
        make.height.equalTo(80);
    }];
    
//    UIView* view = [[UIView alloc] init];
//    [self addSubview:view];
    
    _countMoneyLab = [[UILabel alloc] init];
    _countMoneyLab.text = @"未选购商品";
    _countMoneyLab.textColor = [UIColor lightTextColor];
    _countMoneyLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:_countMoneyLab];
    [_countMoneyLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_logoImg.right).equalTo(7);
        make.top.equalTo(bottomView.top).equalTo(8);
    }];
    
    _sendMoneyLab = [[UILabel alloc] init];
    _sendMoneyLab.text = @"商家配送15元";
    _sendMoneyLab.textColor = [UIColor lightTextColor];
    _sendMoneyLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:_sendMoneyLab];
    [_sendMoneyLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_logoImg.right).equalTo(7);
        make.top.equalTo(_countMoneyLab.bottom).equalTo(3);
    }];
    
    _balanceBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [_balanceBtn setTitle:@"¥59元起送" forState:UIControlStateNormal];
//    [_balanceBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateDisabled];
//    [_balanceBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    _balanceBtn.backgroundColor = [UIColor lightGrayColor];
    [_balanceBtn addTarget:self action:@selector(balanceBtn:) forControlEvents:UIControlEventTouchUpInside];
    _balanceBtn.enabled = NO;
    [self addSubview:_balanceBtn];
    [_balanceBtn makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(bottomView.top);
        make.bottom.equalTo(bottomView.bottom);
        make.right.equalTo(self.right);
    }];
    
    self.backgroundColor = [UIColor yellowColor];
}

-(void)balanceBtn:(id)sender
{
    NSLog(@"balanceBtn enabled");
    if (_balance_action) {
        _balance_action();
    }
}

-(void)setbageNum:(NSInteger)num
{
    if (num>0) {
        _balanceBtn.enabled = YES;
    }
    else
    {
        _balanceBtn.enabled = NO;
    }
    [_logoImg pp_addBadgeWithNumber:num];
}

-(void)setaddbageNum:(NSInteger)num
{
    _Countnum += num;
    _balanceBtn.enabled = YES;
    [_logoImg pp_addBadgeWithNumber:_Countnum];
}
-(void)setdelbageNum:(NSInteger)num
{
    _Countnum -= num;
    if (_Countnum < 0) {
        _Countnum = 0;
    }
    [_logoImg pp_addBadgeWithNumber:_Countnum];
    if (_Countnum<=0) {
        _balanceBtn.enabled = NO;
    }
}

@end
