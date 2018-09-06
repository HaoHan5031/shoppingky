//
//  HomeRecommendView.m
//  shopky
//
//  Created by HaoMac on 2018/8/31.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeActivityView.h"

@implementation HomeActivityView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnSubView];
        _activityArr = [NSMutableArray array];
    }
    return self;
}

-(void)addOwnSubView
{
    _leftView = [[UIImageView alloc] init];
    _leftView.contentMode = UIViewContentModeScaleToFill;
    _leftView.userInteractionEnabled = TRUE;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
    [_leftView addGestureRecognizer:tapGesture];
    _leftView.tag = 101;
    [self addSubview:_leftView];
    [_leftView makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.size.equalTo(CGSizeMake(kScreenWidth/2, 75));
    }];
    
    _rightView = [[UIImageView alloc] init];
    _rightView.contentMode = UIViewContentModeScaleToFill;
    _rightView.tag = 102;
    _rightView.userInteractionEnabled = TRUE;
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
    [_rightView addGestureRecognizer:tapGesture1];
    [self addSubview:_rightView];
    [_rightView makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.size.equalTo(CGSizeMake(kScreenWidth/2, 75));
    }];
    _bottomView=[[UIImageView alloc] init];
    _bottomView.contentMode = UIViewContentModeScaleToFill;
    _bottomView.userInteractionEnabled = TRUE;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
    [_bottomView addGestureRecognizer:tapGesture2];
    _bottomView.tag = 103;
    [self addSubview:_bottomView];
    WEAKSELF
    [_bottomView makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(weakSelf.rightView.bottom);
        make.bottom.equalTo(self);
        make.centerX.equalTo(self);
        make.width.equalTo(kScreenWidth);
    }];
}

-(void)setData:(NSArray*)arr
{
    for (int i = 0; i < arr.count; i++) {
        homeActivityModel* model = [[homeActivityModel alloc] initWithDic:arr[i]];
        [_activityArr addObject:model];
        if (model.activity_type == 0) {
            [_leftView sd_setImageWithURL:[NSURL URLWithString:model.activity_image_url]];
        }
        if (model.activity_type == 1) {
            [_rightView sd_setImageWithURL:[NSURL URLWithString:model.activity_image_url]];
        }
        if (model.activity_type == 2) {
            [_bottomView sd_setImageWithURL:[NSURL URLWithString:model.activity_image_url]];
        }
    }
}

-(void)clickImage:(id)sender
{
    
}

@end
