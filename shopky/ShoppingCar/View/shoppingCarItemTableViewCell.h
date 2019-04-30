//
//  shoppingCarItemTableViewCell.h
//  shopky
//
//  Created by HaoMac on 2019/3/20.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shoppingCarItemView.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^openLabTouch)(BOOL flag);
typedef void(^deleteItem)(NSInteger count);
typedef void(^isOpenCell)(NSInteger count, BOOL isopen);
typedef void(^pushBalanceVC)();

@interface headView:UIView

@property(nonatomic, strong)UILabel *shopLab;
@property(nonatomic, strong)UIButton* delBtn;
@property(nonatomic, strong)deleteItem headDelItem;
@end

@interface footView:UIView

@property(nonatomic, strong)UILabel* chfLab;
@property(nonatomic, strong)UILabel* CountMoneyLab;
@property(nonatomic, strong)UIButton* balanceBtn;
@property(nonatomic, strong)UILabel* openLab;
@property(nonatomic, copy)openLabTouch openTouch;
@property(nonatomic, copy)pushBalanceVC pushVC;

@end

@interface shoppingCarItemTableViewCell : UITableViewCell<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView* tableView;
@property(nonatomic, strong)headView* head;
@property(nonatomic, strong)footView* foot;
@property(nonatomic, assign)NSInteger* index;
@property(nonatomic, assign)BOOL isOpen;
@property(nonatomic, strong)NSArray* itemArr;
@property(nonatomic, assign)NSInteger count;
@property(nonatomic, assign)NSInteger Tcount;
@property(nonatomic, copy)deleteItem delItem;
@property(nonatomic, copy)isOpenCell openCell;
@property(nonatomic, copy)pushBalanceVC pushVC;
@property(nonatomic, strong)shopCarListModel* model;

+(CGFloat)getHight:(NSInteger)count isOpen:(BOOL)isopen;
@end

NS_ASSUME_NONNULL_END
