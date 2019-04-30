//
//  myselfTableViewCell.m
//  shopky
//
//  Created by HaoMac on 2019/2/21.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "myselfTableViewCell.h"

@implementation myselfTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *) reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    _imgFlag = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    [self.contentView addSubview:_imgFlag];
    [_imgFlag makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).equalTo(10);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    _labContent = [[UILabel alloc] init];
    _labContent.textAlignment = NSTextAlignmentLeft;
    _labContent.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_labContent];
    [_labContent makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.imgFlag.right).equalTo(10);
    }];
    
    UILabel* lab = [[UILabel alloc] init];
    lab.text = @">";
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:lab];
    [lab makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.right).equalTo(-5);
    }];
    
    UIView* bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:bottomLine];
    [bottomLine makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView.bottom);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(0.5);
    }];
}

-(void)setCellContent:(NSString* )strImgName labContent:(NSString* )strContent
{
    _labContent.text = strContent;
    _imgFlag.image = [UIImage imageNamed:strImgName];
    
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
