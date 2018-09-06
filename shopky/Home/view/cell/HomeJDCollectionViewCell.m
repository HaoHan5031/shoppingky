//
//  HomeJDCollectionViewCell.m
//  shopky
//
//  Created by HaoMac on 2018/9/4.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeJDCollectionViewCell.h"

@implementation HomeJDCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        _image_jd = [[UIImageView alloc] init];
        _image_jd.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_image_jd];
        [_image_jd makeConstraints:^(MASConstraintMaker* make){
            make.center.equalTo(self);
            make.width.equalTo(self.width);
            make.height.equalTo(self.height);
        }];
    }
    return self;
}
-(void)setImageUrl:(NSString *)strUrl
{
    [_image_jd sd_setImageWithURL:[NSURL URLWithString:strUrl]];
}
@end
