//
//  HomeReccomendCollectionViewCell.m
//  shopky
//
//  Created by HaoMac on 2018/9/3.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeReccomendCollectionViewCell.h"

@implementation HomeReccomendCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnsView];
    }
    return self;
}

-(void)addOwnsView
{
    _image_recUrl = [[UIImageView alloc] init];
    _image_recUrl.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_image_recUrl];
    [_image_recUrl makeConstraints:^(MASConstraintMaker* make){
        make.size.equalTo(self);
    }];
}
-(void)setImageUrl:(NSString*)strUrl
{
    [_image_recUrl sd_setImageWithURL:[NSURL URLWithString:strUrl]];
}

@end
