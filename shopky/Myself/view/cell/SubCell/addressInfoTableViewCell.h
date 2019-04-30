//
//  addressInfoTableViewCell.h
//  shopky
//
//  Created by HaoMac on 2019/2/28.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class DCAdressItem;
@interface addressInfoTableViewCell : UITableViewCell

@property (nonatomic, strong)UIButton* btn;

@property (nonatomic, copy) void (^selectBtnClickBlock)(BOOL isSelected);

/* 模型数据 */
@property (strong , nonatomic)DCAdressItem *adItem;

/** 删除点击回调 */
@property (nonatomic, copy) dispatch_block_t deleteClickBlock;
/** 编辑点击回调 */
@property (nonatomic, copy) dispatch_block_t editClickBlock;
@end

NS_ASSUME_NONNULL_END
