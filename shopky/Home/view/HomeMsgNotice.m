//
//  HomeMsgNotice.m
//  shopky
//
//  Created by HaoMac on 2018/8/30.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeMsgNotice.h"

@implementation HomeMsgNotice
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self==[super initWithFrame:frame]) {
        [self addOwnsSubViews];
        _dicMsg = [NSDictionary dictionary];
    }
    return self;
}

-(void)addOwnsSubViews
{
    _imageGif = [[UIImageView alloc] init];
    _imageGif.userInteractionEnabled = TRUE;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage)];
    [_imageGif addGestureRecognizer:tapGesture];
    [self addSubview:_imageGif];
    [_imageGif makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(120);
    }];
    
    //初始化
    _dcTittleRoll = [[DCTitleRolling alloc] initWithFrame:CGRectMake(0, 120, kScreenWidth, 50) WithTitleData:^(CDDRollingGroupStyle *rollingGroupStyle, NSString *__autoreleasing *leftImage, NSArray *__autoreleasing *rolTitles, NSArray *__autoreleasing *rolTags, NSArray *__autoreleasing *rightImages, NSString *__autoreleasing *rightbuttonTitle, NSInteger *interval, float *rollingTime, NSInteger *titleFont, UIColor *__autoreleasing *titleColor, BOOL *isShowTagBorder) {
        
        *rollingTime = 0.25;
        *rolTags = @[@"冬季健康日",@"新手上路",@"年终内购会",@"GitHub星星走一波"];
        *rolTitles = @[@"先领券在购物，一元抢？",@"2000元热门手机推荐",@"好奇么？点进去哈",@"这套家具比房子还贵"];
        *leftImage = @"shouye_img_toutiao";
        *interval = 6.0;
        *titleFont = 14;
        *isShowTagBorder = YES;
        *titleColor = [UIColor darkGrayColor];
    }];
    
    _dcTittleRoll.moreClickBlock = ^{
        NSLog(@"mall----more");
    };
    _dcTittleRoll.delegate = self;
    [_dcTittleRoll dc_beginRolling];
    _dcTittleRoll.backgroundColor = [UIColor whiteColor];
    [self addSubview:_dcTittleRoll];
    
}
-(void)setData:(NSDictionary*)dic
{
    _dicMsg = dic;
    [_imageGif sd_setImageWithURL:[NSURL URLWithString:_dicMsg[@"ad"][@"ad_image_url"]]];
    _imageGif.contentMode = UIViewContentModeScaleToFill;
    
}

-(void)clickImage
{
    
}

#pragma mark - 滚动条点击事件

- (void)dc_RollingViewSelectWithActionAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%zd头条滚动条",index);
}

@end
