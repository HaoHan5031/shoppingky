//
//  ELeMeOrderPageLeftVCCell.h
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"

@interface ELeMeOrderPageLeftVCCell : UITableViewCell

@end
typedef void(^clickButtonBloak)(NSInteger shopNumChange);
typedef void(^addButtonBlock)(CGRect cellBtnRect, NSInteger shopNumChange, BOOL addStatus);
@interface ELeMeOrderPageLeftVCRightCell : UITableViewCell
//控件
@property(nonatomic, strong)UIButton *addButton;//加Button
@property(nonatomic, strong)UIButton *minusButton;//减Button
//字符串
@property(nonatomic, strong)NSString *goodsImgUrlStr;//商品图片视图
@property(nonatomic, strong)NSString *titleStr;//商品标题
@property(nonatomic, strong)NSString *saleNumberStr;//销量
@property(nonatomic, strong)NSString *priceStr;//价格
@property(nonatomic, strong)NSString *shopNumberStr;//购买量
@property(nonatomic, strong)NSString* shopId;
@property(nonatomic, strong)NSString* shopName;
@property (nonatomic, strong)PPNumberButton* addItemButton;
@property(nonatomic, copy)clickButtonBloak buttonBloak;
@property(nonatomic, copy)addButtonBlock addBlock;
@property(nonatomic, assign)BOOL isFirst;//是否第一次赋值
@property(nonatomic, strong)GoodsModel* goodsModel;
-(void)setModelData:(NSDictionary*)dic;
-(void)setShopId:(NSString *)shopId;
-(void)setShopName:(NSString *)shopName;
-(void)setAddbuttonNum:(int)num;
@end

@interface ELeMeOrderPageLeftVCLeftCell : UITableViewCell
@property(nonatomic, strong)NSString *text;
@end
