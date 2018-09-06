//
//  HomeFastBuyCollectionViewCell.m
//  shopky
//
//  Created by HaoMac on 2018/9/3.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeFastBuyCollectionViewCell.h"

@implementation HomeFastBuyCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnsView];
    }
    return self;
}

-(void)addOwnsView
{
    _image_good = [[UIImageView alloc] init];
    _image_good.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_image_good];
    [_image_good makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self);
        make.centerX.equalTo(self);
        make.width.equalTo(self).multipliedBy(0.8);
        make.height.equalTo(100);
    }];
    
    _labPrice = [[UILabel alloc] init];
    _labPrice.font = [UIFont systemFontOfSize:15];
    [self addSubview:_labPrice];
    [_labPrice makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.image_good.bottom).equalTo(3);
        make.centerX.equalTo(self);
    }];
    
    _labCounts = [[UILabel alloc] init];
    _labCounts.font = [UIFont systemFontOfSize:15];
    [self addSubview:_labCounts];
    [_labCounts makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.labPrice.bottom).equalTo(3);
        make.centerX.equalTo(self);
    }];
    
    _image_tag = [[UIImageView alloc] init];
    _image_tag.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_image_tag];
    [_image_tag makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(self.image_good);
        make.bottom.equalTo(self.image_good);
    }];
    
    
}

-(void)setCellItem:(homeGoodsModel *)model
{
    [_image_good sd_setImageWithURL:[NSURL URLWithString:model.imageurl]];
    _labPrice.text = [NSString stringWithFormat:@"¥ %f",model.price];
    _labCounts.text = [NSString stringWithFormat:@"剩余 %d", model.counts];
    //根据id
}

@end
