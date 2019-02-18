//
//  HomeHeadView.h
//  shopky
//
//  Created by HaoMac on 2018/8/27.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeheadModel.h"

@interface HomeHeadView : UIView<SDCycleScrollViewDelegate>
@property(nonatomic, strong) SDCycleScrollView* headScroll;
@property(nonatomic, strong) NSMutableArray<homeheadModel*> *imageArr;
-(void)setData:(NSArray*)arr;
/** 找相似点击回调 */
@property (nonatomic, copy) dispatch_block_t lookSameBlock;
@end
