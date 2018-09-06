//
//  HomeFastBuy.h
//  shopky
//
//  Created by HaoMac on 2018/9/2.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeGoodsModel.h"

@interface HomeFastBuyView : UIView<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong)UICollectionView* goodsCollectionView;
@property(nonatomic, strong)UILabel* labTime;
@property(nonatomic, strong)UILabel* labLiftTime;
@property(nonatomic, strong)UILabel* labDesc;
@property(nonatomic, strong)UIImageView* ImageRight;
@property(nonatomic, strong)NSMutableArray<homeGoodsModel*>* goodsArr;

-(void)setlabTime:(NSString *)time;
-(void)setlabLiftTime:(NSString *)lefttiem;

-(void)setData:(NSArray* )arr;

@end
