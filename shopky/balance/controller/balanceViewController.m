//
//  balanceViewController.m
//  shopky
//
//  Created by HaoMac on 2019/3/18.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "balanceViewController.h"
#import "addressInfoView.h"
#import "balanceFirstTableViewCell.h"
#import "balanceSecondTableViewCell.h"
#import "balanceSecondBottomTableViewCell.h"
#import "balanceSecondMidTableViewCell.h"
#import "balanceBottomView.h"
static NSString* const balanceFirstTableViewCellID = @"balanceFirstTableViewCell";
static NSString* const balanceSecondTableViewCellID = @"balanceSecondTableViewCell";
static NSString* const balanceSecondBottomTableViewCellID = @"balanceSecondBottomTableViewCell";
static NSString* const balanceSecondMidTableViewCellID = @"balanceSecondMidTableViewCell";
@interface balanceViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView* tableView;
@property(nonatomic, strong)balanceBottomView* bottomView;
@end

@implementation balanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:_tableView];
    [_tableView makeConstraints:^(MASConstraintMaker* make){
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(SafeAreaTopHeight);
        make.width.mas_equalTo(kScreenWidth);
        make.height.mas_equalTo(SafeAreaHeightWithBottom);
    }];
    
    addressInfoView* headView = [[addressInfoView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 10, 120)];
    _tableView.tableHeaderView = headView;
    
    [_tableView registerClass:[balanceFirstTableViewCell class] forCellReuseIdentifier:balanceFirstTableViewCellID];
    [_tableView registerClass:[balanceSecondTableViewCell class] forCellReuseIdentifier:balanceSecondTableViewCellID];
    [_tableView registerClass:[balanceSecondBottomTableViewCell class] forCellReuseIdentifier:balanceSecondBottomTableViewCellID];
    [_tableView registerClass:[balanceSecondMidTableViewCell class] forCellReuseIdentifier:balanceSecondMidTableViewCellID];
    
    _bottomView = [[balanceBottomView alloc] init];
    [self.view addSubview:_bottomView];
    [_bottomView makeConstraints:^(MASConstraintMaker* make){
        make.width.equalTo(kScreen_WIDTH);
        make.height.equalTo(50);
        make.bottom.equalTo(self.view.bottom);
        make.centerX.equalTo(self.view);
    }];
    
}


//-(UITableView*)tableView
//{
//    if (!self.tableView) {
//
//    }
//    return self.tableView;
//}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        balanceFirstTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:balanceFirstTableViewCellID];
        if (cell == nil) {
            cell = [[balanceFirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:balanceFirstTableViewCellID];
        }
        switch (indexPath.row) {
            case 0:
            {
                [cell settitleText:@"送达时间"];
                [cell setFlagText:@"尽快送达"];
                return cell;
            }
                break;
                
            case 1:
            {
                [cell settitleText:@"支付方式"];
                [cell setFlagText:@"微信"];
                return cell;
            }
                break;
        }
    }
    else
    {
        switch (indexPath.row) {
            case 0:
            {
                balanceSecondTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:balanceSecondTableViewCellID];
                if (cell == nil) {
                    cell = [[balanceSecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:balanceSecondTableViewCellID];
                }
                [cell setShopName:@"菜老包"];
                return cell;
            }
                break;
            case 1:
            case 2:
            case 3:
            {
                balanceSecondMidTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:balanceSecondMidTableViewCellID];
                if (cell == nil) {
                    cell = [[balanceSecondMidTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:balanceSecondMidTableViewCellID];
                }
                if (indexPath.row == 1) {
                    [cell setItemCount:@"x2"];
                    [cell setItemImg:@"sp"];
                    [cell setItemMoney:@"¥88.00"];
                    [cell setItemtitle:@"海底捞"];
                }
                if (indexPath.row == 2) {
                    [cell setItemCount:@""];
                    [cell setItemImg:@"chf"];
                    [cell setItemMoney:@"0"];
                    [cell setItemtitle:@"餐盒费"];
                }
                if (indexPath.row == 3) {
                    [cell setItemCount:@""];
                    [cell setItemImg:@"psf"];
                    [cell setItemMoney:@"¥10"];
                    [cell setItemtitle:@"商家配送"];
                }
                return cell;
            }
                break;
            case 4:
            {
                balanceSecondBottomTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:balanceSecondBottomTableViewCellID];
                if (cell == nil) {
                    cell = [[balanceSecondBottomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:balanceSecondBottomTableViewCellID];
                }
                return cell;
            }
                break;
            default:
                break;
        }
    }
    return nil;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.0001;
    }
    else
    {
        return 10;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    else
    {
        return 5;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


@end
