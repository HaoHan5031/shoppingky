//
//  MovieHeadCollectionReusableView.m
//  shopky
//
//  Created by HaoMac on 2018/9/10.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "MovieHeadCollectionReusableView.h"

@implementation MovieHeadCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleToFill;
        
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker* make){
            make.center.equalTo(self);
            make.size.equalTo(self);
        }];
        UIView *view = [[UIView alloc ] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
        view.backgroundColor = [UIColor blueColor];
        [self addSubview:view];
        [view makeConstraints:^(MASConstraintMaker* make){
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).equalTo(-1);
            make.width.equalTo(kScreenWidth);
            make.height.equalTo(1);
        }];
        
    }
    return  self;
}

-(void)setHeadImage:(NSString*)headImage
{
    [_imageView setImage:[UIImage imageNamed:headImage]];
}

@end
