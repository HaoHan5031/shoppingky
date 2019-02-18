//
//  MoiveFootCollectionReusableView.m
//  shopky
//
//  Created by HaoMac on 2018/9/10.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "MoiveFootCollectionReusableView.h"

@implementation MoiveFootCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        _labKF = [[UILabel alloc] init];
        _labKF.font = [UIFont systemFontOfSize:15];
        _labKF.textAlignment = NSTextAlignmentCenter;
        _labKF.textColor = [UIColor whiteColor];
        _labKF.text = @"观看电影点击回复1即可";
        [self addSubview:_labKF];
        [_labKF makeConstraints:^(MASConstraintMaker* make){
            make.center.equalTo(self);
        }];
        
        self.backgroundColor = [UIColor greenColor];
        self.layer.cornerRadius = 8;
        
        self.layer.masksToBounds = YES;
    }
    return  self;
}
@end
