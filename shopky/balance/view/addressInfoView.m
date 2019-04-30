//
//  addressInfoView.m
//  shopky
//
//  Created by HaoMac on 2019/3/18.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "addressInfoView.h"

@implementation addressInfoView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    UILabel* labFlag = [[UILabel alloc] init];
    labFlag.text = @"订单配送至";
    labFlag.font = [UIFont systemFontOfSize:10];
    labFlag.textColor = [UIColor lightTextColor];
    [self addSubview:labFlag];
    [labFlag makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(5);
        make.left.equalTo(10);
    }];
    
    _addressLab = [[UILabel alloc] init];
    _addressLab.text = @"海泰创新基地B区2号3门701";
    _addressLab.textColor = [UIColor whiteColor];
    _addressLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:_addressLab];
    [_addressLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(10);
        make.top.equalTo(labFlag.bottom).equalTo(10);
    }];
    
    _nameLab = [[UILabel alloc] init];
    _nameLab.text = @"张浩";
    _nameLab.textColor = [UIColor whiteColor];
    _nameLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:_nameLab];
    [_nameLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(10);
        make.top.equalTo(_addressLab.bottom).equalTo(10);
    }];
    
    _phoneLab = [[UILabel alloc] init];
    _phoneLab.text = @"18722141993浩";
    _phoneLab.textColor = [UIColor whiteColor];
    _phoneLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:_phoneLab];
    [_phoneLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_nameLab.right).equalTo(20);
        make.top.equalTo(_addressLab.bottom).equalTo(10);
    }];
    
    self.backgroundColor = [UIColor clearColor];
    
}

@end
