//
//  LTPageViewTestOneVC.h
//  OCExample
//
//  Created by 高刘通 on 2018/6/28.
//  Copyright © 2018年 LT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface HomeCollectSelectVC : UIViewController

@property(assign, nonatomic) NSInteger totalCount;
@property(assign, nonatomic) NSInteger shoptag;
@property(nonatomic, strong) NSMutableArray* shoparr;

-(void)setShoparr:(NSMutableArray *)shoparr;
-(void)setShoptag:(NSInteger)shoptag;

@end
