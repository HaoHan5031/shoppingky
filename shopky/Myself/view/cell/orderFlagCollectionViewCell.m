//
//  orderFlagCollectionViewCell.m
//  shopky
//
//  Created by HaoMac on 2019/2/27.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "orderFlagCollectionViewCell.h"
#import "DCStateItem.h"

@implementation orderFlagCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    self.bgimg = [[UIImageView alloc] init];
    self.bgimg.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgimg];
    [self.bgimg mas_makeConstraints:^(MASConstraintMaker* make){
        make.center.equalTo(self.contentView);
        make.size.equalTo(self.contentView);
    }];
    
    self.btnOrderFlag = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.btnOrderFlag];
    [self.btnOrderFlag mas_makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self.contentView);
        
        make.bottom.equalTo(self.contentView.bottom).equalTo(-30);
    }];
    
    self.labOrderFlag = [[UILabel alloc] init];
    self.labOrderFlag.textColor = [UIColor blackColor];
    self.labOrderFlag.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.labOrderFlag];
    [self.labOrderFlag mas_makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.btnOrderFlag.bottom).equalTo(10);
    }];
    
}

#pragma mark - 赋值
- (void)setStateItem:(DCStateItem *)stateItem
{
    _stateItem = stateItem;
    
    self.bgimg.backgroundColor = (stateItem.bgColor) ? RGB(240, 240, 240) : [UIColor whiteColor];
    if (stateItem.showImage) {
        [self.btnOrderFlag setImage:[UIImage imageNamed:stateItem.imageContent] forState:0];
    }else{
        [self.btnOrderFlag setTitle:stateItem.imageContent forState:0];
    }
    
    self.labOrderFlag.text = stateItem.stateTitle;
}

@end
