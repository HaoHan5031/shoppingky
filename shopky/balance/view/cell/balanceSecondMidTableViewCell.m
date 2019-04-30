//
//  balanceSecondMidTableViewCell.m
//  shopky
//
//  Created by HaoMac on 2019/3/18.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "balanceSecondMidTableViewCell.h"

@implementation balanceSecondMidTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *) reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    _goodsImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    _goodsImg.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:_goodsImg];
    [_goodsImg makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(10);
        
    }];
    
    _goodsNameLab = [[UILabel alloc] init];
    _goodsNameLab.textAlignment = NSTextAlignmentLeft;
    _goodsNameLab.font = [UIFont systemFontOfSize:15];
    _goodsNameLab.text = @"兰州拉面";
    [self.contentView addSubview:_goodsNameLab];
    [_goodsNameLab makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(_goodsImg);
        make.left.equalTo(_goodsImg.right).equalTo(5);
    }];
    
    _goodsMoney = [[UILabel alloc] init];
    _goodsMoney.textAlignment = NSTextAlignmentLeft;
    _goodsMoney.font = [UIFont systemFontOfSize:15];
    _goodsMoney.text = @"¥26.89";
    [self.contentView addSubview:_goodsMoney];
    [_goodsMoney makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(_goodsImg);
        make.right.equalTo(self.contentView.right).equalTo(-10);
    }];
    
    _goodsCountLab = [[UILabel alloc] init];
    _goodsCountLab.textAlignment = NSTextAlignmentLeft;
    _goodsCountLab.font = [UIFont systemFontOfSize:8];
    _goodsCountLab.text = @"x1";
    [self.contentView addSubview:_goodsCountLab];
    [_goodsCountLab makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(_goodsImg);
        make.right.equalTo(_goodsMoney.left).equalTo(-5);
    }];
    
    
}

-(void)setItemImg:(NSString*)imgName
{
    [_goodsImg setImage:[UIImage imageNamed:imgName]];
}

-(void)setItemtitle:(NSString*)titleName
{
    _goodsNameLab.text = titleName;
}
-(void)setItemMoney:(NSString*)moneyName
{
    _goodsMoney.text = moneyName;
}

-(void)setItemCount:(NSString*)count
{
    _goodsCountLab.text = count;
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
