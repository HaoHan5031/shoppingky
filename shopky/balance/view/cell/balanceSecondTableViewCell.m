//
//  balanceSeconfTableViewCell.m
//  shopky
//
//  Created by HaoMac on 2019/3/18.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "balanceSecondTableViewCell.h"

@implementation balanceSecondTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *) reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self addOwnView];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)addOwnView
{
    _shopNameLab = [[UILabel alloc] init];
    _shopNameLab.text = @"菜老包(华兴里市场店)";
    _shopNameLab.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_shopNameLab];
    [_shopNameLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(10);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setShopName:(NSString*)shopName
{
    _shopNameLab.text = shopName;
}

@end
