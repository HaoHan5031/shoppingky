//
//  HomeHeadView.m
//  shopky
//
//  Created by HaoMac on 2018/8/27.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeHeadView.h"

#define ViewHight 250

@implementation HomeHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addOwnSubViews];
        self.backgroundColor = [UIColor whiteColor];
        _imageArr = [NSMutableArray array];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
}

-(void) addOwnSubViews
{
    _headScroll = [[SDCycleScrollView alloc] init];
    [self addSubview:_headScroll];
    
    _headScroll.frame = CGRectMake(0, 0, kScreenWidth, ViewHight);
    
    WEAKSELF
    [_headScroll mas_makeConstraints:^(MASConstraintMaker *make){
        make.center.mas_equalTo(weakSelf);
        make.width.mas_equalTo(kScreenWidth);
        make.height.mas_equalTo(ViewHight);
    }];
}

-(void)setData:(NSArray*)arr
{
    NSMutableArray* arrtemp = [NSMutableArray array];
    
    for (int i = 0; i<arr.count; i++) {
        homeheadModel* tempModel = [[homeheadModel alloc] initWithDic:arr[i]];
        [_imageArr addObject:tempModel];
        [arrtemp addObject:[[NSString alloc] initWithString:tempModel.image_url] ];
    }
    [_headScroll setImageURLStringsGroup:arrtemp];
}

#pragma mark SDCycleScrollViewDetegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    //NSLog(@"点击图片");
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    //NSLog(@"图片滚动");
}


@end
