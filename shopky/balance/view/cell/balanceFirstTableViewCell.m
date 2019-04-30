//
//  balanceFirstTableViewCell.m
//  shopky
//
//  Created by HaoMac on 2019/3/18.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "balanceFirstTableViewCell.h"

@implementation balanceFirstTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *) reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    _titleLab = [[UILabel alloc] init];
    _titleLab.textColor = [UIColor blackColor];
    _titleLab.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_titleLab];
    [_titleLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(3);
        make.centerY.equalTo(self.contentView);
    }];
    
    _flagLab = [[UILabel alloc] init];
    _flagLab.textColor = [UIColor blueColor];
    _flagLab.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_flagLab];
    [_flagLab makeConstraints:^(MASConstraintMaker* make){
        make.right.equalTo(self.contentView.right).equalTo(-5);
        make.centerY.equalTo(self.contentView);
    }];
}

-(void)settitleText:(NSString*)title
{
    _titleLab.text = title;
}
-(void)setFlagText:(NSString*)flag
{
    _flagLab.text = flag;
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
