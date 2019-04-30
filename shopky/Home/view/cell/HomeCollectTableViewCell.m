//
//  HomeCollectTableViewCell.m
//  shopky
//
//  Created by HaoMac on 2019/2/19.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "HomeCollectTableViewCell.h"
#import "../../model/homeCollectShopModel.h"

@implementation HomeCollectTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    
    _labShopname = [[UILabel alloc] init];
    _labShopname.font = [UIFont systemFontOfSize:15];
    _labShopname.textAlignment = NSTextAlignmentLeft;
    _labShopname.numberOfLines = 0;
    _labShopname.preferredMaxLayoutWidth=200;
    [_labShopname setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.contentView addSubview:_labShopname];
    [_labShopname makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.contentView).equalTo(32*Parameter);
        make.left.equalTo(22*Parameter);
        
    }];
    
    _labAddress = [[UILabel alloc] init];
    _labAddress.font = [UIFont systemFontOfSize:13];
    _labAddress.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_labAddress];
    [_labAddress makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(81*Parameter);
        make.left.equalTo(22*Parameter);
        
    }];
    
    _imgActive = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imgActive.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:_imgActive];
    [_imgActive makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).equalTo(10);
    }];
    
    _labMJ = [[UILabel alloc] init];
    _labMJ.font = [UIFont systemFontOfSize:15];
    _labMJ.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_labMJ];
    [_labCollect makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.imgActive);
        make.left.equalTo(self.imgActive).equalTo(18*Parameter);
    }];
    
    _labDistance = [[UILabel alloc] init];
    _labDistance.font = [UIFont systemFontOfSize:15];
    _labDistance.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_labDistance];
    [_labDistance makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.imgActive);
        make.right.equalTo(-20*Parameter);
    }];
    
    _imgLeft = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imgLeft.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:_imgLeft];
    [_imgLeft makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).equalTo(10);
        make.width.equalTo(421*Parameter);
        make.height.equalTo(312*Parameter);
    }];
    
    _imgRightTop = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imgRightTop.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:_imgRightTop];
    [_imgRightTop makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(180*Parameter);
        make.left.equalTo(self.contentView).equalTo(22*Parameter);
        make.width.equalTo(257*Parameter);
        make.height.equalTo(153*Parameter);
    }];
    
    _imgRightBottom = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imgRightBottom.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:_imgRightBottom];
    [_imgRightBottom makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(_imgRightTop.bottom).equalTo(6*Parameter);
        make.left.equalTo(_imgLeft.right).equalTo(6*Parameter);
        make.width.equalTo(257*Parameter);
        make.height.equalTo(153*Parameter);
    }];
    
}

-(void)setViewData:(NSDictionary*)dic
{
    homeCollectShopModel* tempModel = [[homeCollectShopModel alloc] initWithDic:dic];
    _labShopname.text = tempModel.shop_name;
    _labAddress.text = tempModel.shop_address;
    _labCollect.text = tempModel.collect_count;
    //[_imgHead sd_setImageWithURL:[NSURL URLWithString:tempModel.shop_image]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
