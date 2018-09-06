//
//  HomeViewController.h
//  shopky
//
//  Created by HaoMac on 2018/8/23.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHeadView.h"

@interface HomeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView* tableview;
@property(nonatomic, strong)NSArray* headArr;
@property(nonatomic, strong)NSArray* gridArr;
@property(nonatomic, strong)NSArray* activityArr;
@property(nonatomic, strong)NSDictionary* noticeMsgDic;
@property(nonatomic, strong)NSDictionary* fastBuyDic;
@property(nonatomic, strong)NSDictionary* recommendDic;
@property(nonatomic, strong)NSDictionary* homeJDDic;
@property(nonatomic, strong)NSArray* youlikeArr;
@end
