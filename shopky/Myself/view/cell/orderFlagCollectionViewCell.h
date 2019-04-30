//
//  orderFlagCollectionViewCell.h
//  shopky
//
//  Created by HaoMac on 2019/2/27.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class DCStateItem;
@interface orderFlagCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong)UIImageView* bgimg;
@property(nonatomic, strong)UIButton* btnOrderFlag;
@property(nonatomic, strong)UILabel* labOrderFlag;

@property (strong , nonatomic)DCStateItem *stateItem;

@end

NS_ASSUME_NONNULL_END
