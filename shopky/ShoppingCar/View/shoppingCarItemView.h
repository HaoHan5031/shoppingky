//
//  shoppingCarItemView.h
//  shopky
//
//  Created by HaoMac on 2019/3/20.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface shoppingCarItemView : UITableViewCell
@property(nonatomic, strong)UIImageView* itemImg;
@property(nonatomic, strong)UILabel* itemLab;
@property(nonatomic, strong)UILabel* descLab;
@property(nonatomic, strong)UILabel* countLab;
@property(nonatomic, strong)UILabel* priceCountLab;
@property(nonatomic, strong)UIButton* delBtn;
@property(nonatomic, strong)shopcarDBModel* model;
@end

NS_ASSUME_NONNULL_END
