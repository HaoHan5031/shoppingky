//
//  ELeMeOrderPageLeftVCCell.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ELeMeOrderPageLeftVCCell.h"
@implementation ELeMeOrderPageLeftVCCell



@end

@implementation ELeMeOrderPageLeftVCRightCell

{
    UIImageView *_goodsImageView;//商品图片视图
    UILabel *_titleLable;//商品标题Lable
    UILabel *_saleNumberLable;//销量Lable
    UILabel *_priceLable;//价格Lable
    UILabel *_shopNumberLable;//购买量Lable
    UIBezierPath *_path;
    
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
        
    }
    return self;
}


//创建子视图

-(void)createSubViews
{
    
    
    //创建商品图片视图
    _goodsImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_goodsImageView];
    //创建lable视图
    NSArray *textColorStrArr = @[UIColor_333333,UIColor_666666,UIColor_fe4900,UIColor_333333];
    NSArray *textFontArr = @[[UIFont systemFontOfSize:13],[UIFont systemFontOfSize:11],[UIFont systemFontOfSize:12],[UIFont systemFontOfSize:14]];
    
    for (int i = 0; i < 4; i++) {
        UILabel *lable = [[UILabel alloc]init];
        lable.textColor = textColorStrArr[i];
        lable.font = textFontArr[i];
        [self.contentView addSubview:lable];
        
        switch (i) {
            case 0:
                
                _titleLable = lable;
                break;
            case 1:
                _saleNumberLable = lable;
                break;
            case 2:
                _priceLable = lable;
                break;
            case 3:
                lable.textAlignment = NSTextAlignmentCenter;
                
                _shopNumberLable = lable;
                break;
                
            default:
                break;
        }
    }
    
    
    _addItemButton = [[PPNumberButton alloc] init];
    _addItemButton.decreaseHide = YES;
    _addItemButton.increaseImage = [UIImage imageNamed:@"increase_meituan"];
    _addItemButton.decreaseImage = [UIImage imageNamed:@"decrease_meituan"];
    _addItemButton.currentNumber = -777;
    WEAKSELF
    _addItemButton.resultBlock = ^(NSInteger number, BOOL increaseStatus){
        NSLog(@"%ld",(long)number);
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect fromRect = [weakSelf.addItemButton convertRect:_addItemButton.bounds toView:window];
        if (weakSelf.addBlock) {
            weakSelf.addBlock(fromRect, number, increaseStatus);
        }
        if (number== 1 && increaseStatus) {
            shopcarDBModel * model = [[shopcarDBModel alloc] init];
            model.shopId = weakSelf.shopId;
            model.goodsId = weakSelf.goodsModel.goods_id;
            model.goodsName = weakSelf.goodsModel.title;
            model.count = 1;
            model.price = weakSelf.goodsModel.price;
            model.shopName = weakSelf.shopName;
            [[Singleton shareInstance] insertGoodsData:model];
        }
        if (number > 1 && increaseStatus) {
            shopcarDBModel * model = [[shopcarDBModel alloc] init];
            model.shopId = weakSelf.shopId;
            model.goodsId = weakSelf.goodsModel.goods_id;
            model.goodsName = weakSelf.goodsModel.title;
            model.count = number;
            model.price = weakSelf.goodsModel.price;
            model.shopName = weakSelf.shopName;
            [[Singleton shareInstance] updateGoodsData:model newModel:model];
        }
        if (!increaseStatus && number!=0) {
            shopcarDBModel * model = [[shopcarDBModel alloc] init];
            model.shopId = weakSelf.shopId;
            model.goodsId = weakSelf.goodsModel.goods_id;
            model.goodsName = weakSelf.goodsModel.title;
            model.count = number;
            model.price = weakSelf.goodsModel.price;
            model.shopName = weakSelf.shopName;
            [[Singleton shareInstance] updateGoodsData:model newModel:model];
        }
        if (number == 0) {
            shopcarDBModel * model = [[shopcarDBModel alloc] init];
            model.shopId = weakSelf.shopId;
            model.goodsId = weakSelf.goodsModel.goods_id;
            [[Singleton shareInstance] deleteGoodsData:model];
        }
    };
    [self addSubview:_addItemButton];
    [_addItemButton makeConstraints:^(MASConstraintMaker* make){
        make.right.equalTo(self.right).equalTo(-5);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(100);
        make.height.equalTo(20);
    }];
    
    //添加约束
    //商品图片视图约束
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12);
        make.left.equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(55, 55));
    }];
    //商品标题Lable约束
    _titleLable.numberOfLines = 0;
    _titleLable.preferredMaxLayoutWidth=160;
    [_titleLable setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12);
        make.left.mas_equalTo(_goodsImageView.mas_right).with.offset(10);
        make.right.equalTo(-30);
        make.height.mas_equalTo(32);
    }];
    //销量lable约束
    [_saleNumberLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLable.mas_bottom).with.offset(4);
        make.left.mas_equalTo(_goodsImageView.mas_right).with.offset(10);
        make.right.equalTo(@-10);
        make.height.mas_equalTo(12);
    }];
    
    //售价lable约束
    [_priceLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_saleNumberLable.mas_bottom).with.offset(3);
        make.left.mas_equalTo(_goodsImageView.mas_right).with.offset(10);
        make.height.mas_equalTo(16);
    }];
    
    
    [self layoutIfNeeded];
}

//重写set方法
-(void)setGoodsImgUrlStr:(NSString *)goodsImgUrlStr
{
    _goodsImgUrlStr = goodsImgUrlStr;
    _goodsImageView.image = [UIImage imageNamed:@"foodMsg.jpg"];
    
//    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:goodsImgUrlStr] placeholderImage:PLACEHODLEIMG];
}
-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    _titleLable.text = titleStr;
}
-(void)setSaleNumberStr:(NSString *)saleNumberStr
{
    _saleNumberStr = saleNumberStr;
    
    _saleNumberLable.text = [NSString stringWithFormat:@"已售%ld份",(long)[saleNumberStr integerValue]];
}
-(void)setPriceStr:(NSString *)priceStr
{
    _priceStr = priceStr;
    _priceLable.text = [NSString stringWithFormat:@"¥%@",priceStr];;
    
}

-(void)setShopNumberStr:(NSString *)shopNumberStr
{
    _shopNumberStr = [NSString stringWithFormat:@"销量%@份", shopNumberStr];
    _saleNumberLable.text = _shopNumberStr;
}

-(void)setModelData:(NSDictionary*)dic
{
    _goodsModel = [[GoodsModel alloc] initWithDic:dic];
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:_goodsModel.image]];
    _titleLable.text = _goodsModel.title;
    _priceLable.text = _goodsModel.price;
    _saleNumberLable.text = [NSString stringWithFormat:@"销售%d份",_goodsModel.sale_count];
}

-(void)setShopId:(NSString *)shopId
{
    _shopId = shopId;
}

-(void)setShopName:(NSString *)shopName
{
    _shopName = shopName;
}
-(void)setAddbuttonNum:(int)num
{
    _addItemButton.currentNumber = num;
}

@end

@implementation ELeMeOrderPageLeftVCLeftCell

{
    UILabel *_textLable;
}
//重写初始化函数
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect frame = self.contentView.bounds;
        _textLable = [[UILabel alloc]initWithFrame:frame];
        _textLable.textColor = UIColor_666666;
        _textLable.font = [UIFont systemFontOfSize:15];
        _textLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_textLable];
    }
    return self;
}



-(void)setText:(NSString *)text
{
    _text = text;
    
    _textLable.text = text;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = self.contentView.bounds;
    _textLable.frame = frame;
}



@end
