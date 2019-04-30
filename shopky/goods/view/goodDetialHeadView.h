//
//  goodDetialHeadView.h
//  shopky
//
//  Created by HaoMac on 2019/3/14.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "goodDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^closeView)();
typedef void(^addGood)(NSInteger shopNumChange, BOOL addStatus);

@interface goodDetialHeadView : UIView<PPNumberButtonDelegate>
@property (nonatomic, strong)UIImageView* headImg;
@property (nonatomic, strong)UILabel* nameLab;
@property (nonatomic, strong)UILabel* sellsLab;
@property (nonatomic, strong)UILabel* priceLab;
@property (nonatomic, strong)PPNumberButton* addButton;
@property (nonatomic, strong)UILabel* descLab;
@property (nonatomic, copy)closeView closeview;
@property (nonatomic, copy)addGood addgood;
@property (nonatomic, strong)goodDetailModel* goodModel;
-(void)setHeadModel:(NSDictionary* )dic;
@end

NS_ASSUME_NONNULL_END
