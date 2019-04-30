//
//  shopHeaderView.m
//  shopky
//
//  Created by HaoMac on 2019/3/14.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "shopHeaderView.h"

@implementation shopHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    _headImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    [_headImg sd_setImageWithURL:[NSURL URLWithString:@"http://www.bytrip.com/Uploads/Picture/2017-10-30/59f68cc9814a2.jpg"]];
    [self addSubview:_headImg];
    [_headImg makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self);
        make.left.equalTo(self).equalTo(5);
        make.width.equalTo(70);
        make.height.equalTo(70);
    }];
    
    _nameLab = [[UILabel alloc] init];
    _nameLab.font = [UIFont systemFontOfSize:15];
    _nameLab.textAlignment = NSTextAlignmentLeft;
    _nameLab.text = @"长盛超市";
    [self addSubview:_nameLab];
    [_nameLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(self.headImg.right).equalTo(5);
        make.top.equalTo(self.headImg.top);
    }];
    
    _noticeLab = [[UILabel alloc] init];
    _noticeLab.font = [UIFont systemFontOfSize:15];
    _noticeLab.textAlignment = NSTextAlignmentLeft;
    _noticeLab.text = @"新用户减免15";
    [self addSubview:_noticeLab];
    [_noticeLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(self.headImg.right).equalTo(5);
        make.centerY.equalTo(self.headImg);
    }];
    
    _sendLab = [[UILabel alloc] init];
    _sendLab.font = [UIFont systemFontOfSize:15];
    _sendLab.textAlignment = NSTextAlignmentLeft;
    _sendLab.layer.cornerRadius = 4.;//边框圆角大小
    _sendLab.layer.masksToBounds = YES;
    _sendLab.layer.borderColor = [UIColor colorWithRed:0.98 green:0.61 blue:0.21 alpha:1].CGColor;//边框颜色
    _sendLab.layer.borderWidth = 1;//边框宽度
    _sendLab.text = @"商家配送，28分钟";
    [self addSubview:_sendLab];
    [_sendLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(self.headImg.right).equalTo(5);
        make.bottom.equalTo(self.headImg.bottom);
    }];
}

@end
