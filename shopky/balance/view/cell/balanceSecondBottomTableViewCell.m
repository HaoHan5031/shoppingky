//
//  balanceFirstBottomTableViewCell.m
//  shopky
//
//  Created by HaoMac on 2019/3/18.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "balanceSecondBottomTableViewCell.h"

@implementation balanceSecondBottomTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *) reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    UILabel* lab = [[UILabel alloc] init];
    lab.text = @"总计";
    lab.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:lab];
    [lab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(self.contentView).equalTo(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    _TotaleLab = [[UILabel alloc] init];
    _TotaleLab.font = [UIFont systemFontOfSize:15];
    _TotaleLab.text = @"¥199.00";
    [self.contentView addSubview:_TotaleLab];
    [_TotaleLab makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.right).equalTo(-10);
    }];
}

-(void)setTotale:(NSString*)count
{
    _TotaleLab.text = count;
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
