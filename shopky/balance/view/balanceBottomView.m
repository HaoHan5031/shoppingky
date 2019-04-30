//
//  balanceBottomView.m
//  shopky
//
//  Created by HaoMac on 2019/3/19.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "balanceBottomView.h"

@implementation balanceBottomView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    UIView* view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.7;
    [self addSubview:view];
    [view makeConstraints:^(MASConstraintMaker* make){
        make.center.equalTo(self);
        make.size.equalTo(self);
    }];
    
    _countMoneyLab = [[UILabel alloc] init];
    _countMoneyLab.text = @"¥199.0元";
    _countMoneyLab.textColor = [UIColor whiteColor];
    _countMoneyLab.font = [UIFont systemFontOfSize:20];
    [self addSubview:_countMoneyLab];
    [_countMoneyLab makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self);
        make.left.equalTo(self).equalTo(10);
    }];
    
    _balanceBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [_balanceBtn setTitle:@"结算" forState:UIControlStateNormal];
    
    _balanceBtn.backgroundColor = [UIColor greenColor];
    [_balanceBtn addTarget:self action:@selector(balanceBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_balanceBtn];
    [_balanceBtn makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.top);
        make.bottom.equalTo(self.bottom);
        make.right.equalTo(self.right);
        make.width.equalTo(50);
    }];
    
    
}

-(void)balanceBtn:(id)sender
{
    NSLog(@"结算");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
