//
//  balanceSecondMidTableViewCell.h
//  shopky
//
//  Created by HaoMac on 2019/3/18.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface balanceSecondMidTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView* goodsImg;
@property(nonatomic, strong)UILabel* goodsNameLab;
@property(nonatomic, strong)UILabel* goodsCountLab;
@property(nonatomic, strong)UILabel* goodsMoney;
-(void)setItemImg:(NSString*)imgName;
-(void)setItemtitle:(NSString*)titleName;
-(void)setItemMoney:(NSString*)moneyName;
-(void)setItemCount:(NSString*)count;
@end

NS_ASSUME_NONNULL_END
