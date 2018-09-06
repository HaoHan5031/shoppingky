//
//  HomeRecommendView.h
//  shopky
//
//  Created by HaoMac on 2018/8/31.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeActivityModel.h"

@interface HomeActivityView : UIView
@property(nonatomic, strong)UIImageView* leftView;
@property(nonatomic, strong)UIImageView* rightView;
@property(nonatomic, strong)UIImageView* bottomView;
@property(nonatomic, strong)NSMutableArray<homeActivityModel *>* activityArr;

-(void)setData:(NSArray*)arr;
@end
