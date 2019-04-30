//
//  goodDetialHeadView.m
//  shopky
//
//  Created by HaoMac on 2019/3/14.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "goodDetialHeadView.h"

@implementation goodDetialHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    _headImg = [[UIImageView alloc] initWithFrame:CGRectZero];
    [_headImg setImage:[UIImage imageNamed:@"good"]];
    [self addSubview:_headImg];
    [_headImg makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(kScreenHeight/2);
        make.top.equalTo(self);
    }];
    
    _nameLab = [[UILabel alloc] init];
    _nameLab.textColor = [UIColor blackColor];
    _nameLab.textAlignment = NSTextAlignmentLeft;
    _nameLab.font = [UIFont systemFontOfSize:15];
    _nameLab.text = @"可爱多芒果酸奶味冰淇淋62g";
    _nameLab.numberOfLines = 0;
    _nameLab.preferredMaxLayoutWidth=160;
    [_nameLab setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self addSubview:_nameLab];
    [_nameLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(10);
        make.top.equalTo(_headImg.bottom).equalTo(5);
        make.right.equalTo(-30);
        make.height.equalTo(37);
        
    }];
    
    _sellsLab = [[UILabel alloc] init];
    _sellsLab.textColor = [UIColor lightGrayColor];
    _sellsLab.textAlignment = NSTextAlignmentLeft;
    _sellsLab.text = @"月销10单";
    [self addSubview:_sellsLab];
    [_sellsLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_nameLab.left);
        make.top.equalTo(_nameLab.bottom).equalTo(5);
    }];
    
    _priceLab = [[UILabel alloc] init];
    _priceLab.textColor = [UIColor redColor];
    _priceLab.textAlignment = NSTextAlignmentLeft;
    _priceLab.font = [UIFont systemFontOfSize:20];
    _priceLab.text = @"¥45元";
    [self addSubview:_priceLab];
    [_priceLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_nameLab.left);
        make.top.equalTo(_sellsLab.bottom).equalTo(7);
    }];
    
    _addButton = [[PPNumberButton alloc] init];
    _addButton.decreaseHide = YES;
    _addButton.increaseImage = [UIImage imageNamed:@"increase_meituan"];
    _addButton.decreaseImage = [UIImage imageNamed:@"decrease_meituan"];
    _addButton.currentNumber = -777;
    _addButton.resultBlock = ^(NSInteger number, BOOL increaseStatus){
        NSLog(@"%ld",(long)number);
        if (_addgood) {
            _addgood(number, increaseStatus);
        }
        
    };
    [self addSubview:_addButton];
    [_addButton makeConstraints:^(MASConstraintMaker* make){
        make.right.equalTo(self.right).equalTo(-5);
        make.centerY.equalTo(_priceLab.centerY);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
    
    _descLab = [[UILabel alloc] init];
    _descLab.textColor = [UIColor lightGrayColor];
    _descLab.textAlignment = NSTextAlignmentLeft;
    _descLab.font = [UIFont systemFontOfSize:10];
    _descLab.text = @"草莓口味";
    [self addSubview:_descLab];
    [_descLab makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_nameLab.left);
        make.top.equalTo(_priceLab.bottom).equalTo(10);
    }];
    
    UILabel* assessLab = [[UILabel alloc] init];
    assessLab.textColor = [UIColor blackColor];
    assessLab.text = @"商品评价";
    assessLab.font = [UIFont systemFontOfSize:20];
    [self addSubview:assessLab];
    [assessLab makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.descLab.bottom).equalTo(10);
        make.left.equalTo(_nameLab.left);
    }];
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton* closeBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateHighlighted];
    [self addSubview:closeBtn];
    [closeBtn makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(10);
        make.right.equalTo(self.right).equalTo(-10);
        make.width.equalTo(40);
        make.height.equalTo(40);
    }];
    [closeBtn addTarget:self action:@selector(addButtonBarItemClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* shareBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [shareBtn setImage:[UIImage imageNamed:@"shareitem"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"shareitem"] forState:UIControlStateHighlighted];
    [self addSubview:shareBtn];
    [shareBtn makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(10);
        make.right.equalTo(closeBtn.left).equalTo(10);
        make.width.equalTo(40);
        make.height.equalTo(40);
    }];
    [shareBtn addTarget:self action:@selector(addButtonBarItemClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addButtonBarItemClick
{
    if (_closeview) {
        _closeview();
    }
}

-(void)setHeadModel:(NSDictionary* )dic
{
    _goodModel = [[goodDetailModel alloc] initWithDic:dic];
    [_headImg sd_setImageWithURL:[NSURL URLWithString:_goodModel.shop_image]];
    _nameLab.text = _goodModel.title;
    _descLab.text = _goodModel.intro;
    _priceLab.text = [NSString stringWithFormat:@"%f",_goodModel.price];
    _sellsLab.text = [NSString stringWithFormat:@"%d",_goodModel.sale_count];
    
}


@end
