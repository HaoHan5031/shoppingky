//
//  myselfTableViewCell.h
//  shopky
//
//  Created by HaoMac on 2019/2/21.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface myselfTableViewCell : UITableViewCell
@property(nonatomic, strong)UILabel* labContent;
@property(nonatomic, strong)UIImageView* imgFlag;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *) reuseIdentifier;
-(void)setCellContent:(NSString* )strImgName labContent:(NSString* )strContent;
@end

NS_ASSUME_NONNULL_END
