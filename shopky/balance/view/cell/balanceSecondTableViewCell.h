//
//  balanceSeconfTableViewCell.h
//  shopky
//
//  Created by HaoMac on 2019/3/18.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface balanceSecondTableViewCell : UITableViewCell
@property(nonatomic, strong)UILabel* shopNameLab;
-(void)setShopName:(NSString*)shopName;
@end

NS_ASSUME_NONNULL_END
