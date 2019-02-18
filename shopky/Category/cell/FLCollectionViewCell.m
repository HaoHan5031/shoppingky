//
//  FLCollectionViewCell.m
//  shopky
//
//  Created by HaoMac on 2018/9/10.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "FLCollectionViewCell.h"

@implementation FLCollectionViewCell
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
    }
    return  self;
}
-(void)setImageName:(NSString *)imageName
{
    [_imageView setImage:[UIImage imageNamed:imageName]];
}
@end
