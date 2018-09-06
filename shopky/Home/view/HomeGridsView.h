//
//  HomeGridsView.h
//  shopky
//
//  Created by HaoMac on 2018/8/28.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homegirdsModel.h"

@interface HomeGridsView : UIView
@property(nonatomic, strong)NSMutableArray <homegirdsModel*>* gridsArr;
-(void)setData:(NSArray*)arr;

@end
