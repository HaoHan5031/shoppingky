//
//  HomeFastBuyCollectionViewCell.h
//  shopky
//
//  Created by HaoMac on 2018/9/3.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeGoodsModel.h"
@interface HomeFastBuyCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong)UIImageView* image_good;
@property(nonatomic, strong)UILabel* labPrice;
@property(nonatomic, strong)UILabel* labCounts;
@property(nonatomic, strong)UIImageView* image_tag;
-(void)setCellItem:(homeGoodsModel*)model;
@end
