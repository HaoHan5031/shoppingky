//
//  HomeCollectTableViewCell.h
//  shopky
//
//  Created by HaoMac on 2019/2/19.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeCollectTableViewCell : UITableViewCell

@property(nonatomic, strong)UIImageView* imgHead;
@property(nonatomic, strong)UILabel* labShopname;
@property(nonatomic, strong)UILabel* labAddress;
@property(nonatomic, strong)UILabel* labCollect;
@property(nonatomic, strong)UILabel* labDistance; //距离
@property(nonatomic, strong)UIImageView* imgActive;//
@property(nonatomic, strong)UILabel* labDesc;//优惠
@property(nonatomic, strong)UILabel* labMJ;//满减
@property(nonatomic, strong)UIImageView* imgLeft;
@property(nonatomic, strong)UIImageView* imgRightTop;
@property(nonatomic, strong)UIImageView* imgRightBottom;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *) reuseIdentifier;
-(void)setViewData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
