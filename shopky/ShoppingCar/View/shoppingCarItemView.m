//
//  shoppingCarItemView.m
//  shopky
//
//  Created by HaoMac on 2019/3/20.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "shoppingCarItemView.h"

@implementation shoppingCarItemView

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    _itemImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"foodMsg.jpg"]];
    [self addSubview:_itemImg];
    [_itemImg makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self);
        make.left.equalTo(10);
        make.width.equalTo(40);
        make.height.equalTo(40);
    }];
    
    _itemLab = [[UILabel alloc] init];
    _itemLab.font = [UIFont systemFontOfSize:12];
    _itemLab.text = @"兰州拉面";
    _itemLab.textColor = UIColor_333333;
    [self addSubview:_itemLab];
    [_itemLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_itemImg.right).equalTo(@5);
        make.top.equalTo(_itemImg.top);
    }];
    
    _descLab = [[UILabel alloc] init];
    _descLab.font = [UIFont systemFontOfSize:8];
    _descLab.text = @"大碗";
    _descLab.textColor = UIColor_999999;
    [self addSubview:_descLab];
    [_descLab makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(_itemImg);
        make.left.equalTo(_itemImg.right).equalTo(@5);
    }];
    
    _countLab = [[UILabel alloc] init];
    _countLab.font = [UIFont systemFontOfSize:10];
    _countLab.text = @"x1";
    _countLab.textColor = UIColor_666666;
    [self addSubview:_countLab];
    [_countLab makeConstraints:^(MASConstraintMaker* make){
        make.bottom.equalTo(_itemImg.bottom);
        make.left.equalTo(_itemImg.right).equalTo(@5);
    }];
    
    _priceCountLab = [[UILabel alloc] init];
    _priceCountLab.font = [UIFont systemFontOfSize:15];
    _priceCountLab.text = @"70.0";
    _priceCountLab.textColor = [UIColor redColor];
    [self addSubview:_priceCountLab];
    [_priceCountLab makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(_itemLab);
        make.right.equalTo(self.right).equalTo(-5);
    }];
    
    _delBtn = [[UIButton alloc] init];
    _delBtn.contentMode =UIViewContentModeScaleAspectFit;
    [self addSubview:_delBtn];
    [_delBtn makeConstraints:^(MASConstraintMaker* make){
        make.right.equalTo(self.right).equalTo(-5);
        make.top.equalTo(_priceCountLab.bottom).equalTo(10);
    }];
    
    
    
}

-(void)setModel:(shopcarDBModel *)model
{
    _model = model;
    _itemLab.text = model.goodsName;
    _descLab.text = model.goodsName;
    _countLab.text = [NSString stringWithFormat:@"x%d",model.count];
    
}

@end
