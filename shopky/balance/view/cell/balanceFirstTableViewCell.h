//
//  balanceFirstTableViewCell.h
//  shopky
//
//  Created by HaoMac on 2019/3/18.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface balanceFirstTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel* titleLab;
@property(nonatomic,strong)UILabel* flagLab;
-(void)settitleText:(NSString*)title;
-(void)setFlagText:(NSString*)flag;
@end

NS_ASSUME_NONNULL_END
