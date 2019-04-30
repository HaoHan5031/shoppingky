//
//  HomeViewController.m
//  shopky
//
//  Created by HaoMac on 2018/8/23.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeadView.h"
#import "HomeGridsView.h"
#import "homeheadViewModel.h"
#import "HomeMsgNotice.h"
#import "HomeActivityView.h"
#import "HomeFastBuyView.h"
#import "HomeRecommendView.h"
#import "HomeJDView.h"
#import "HomeYouLikeView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-45)
                                                  style:UITableViewStyleGrouped];
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    _tableview.sectionFooterHeight = 0.01f;
    [self.view addSubview:_tableview];
    _tableview.backgroundColor = [UIColor clearColor];
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getDataAccess)];
    _headArr = [NSArray array];
    _gridArr = [NSArray array];
    _activityArr = [NSArray array];
    _youlikeArr = [NSArray array];
    _noticeMsgDic = [NSDictionary dictionary];
    _fastBuyDic = [NSDictionary dictionary];
    _recommendDic = [NSDictionary dictionary];
    _homeJDDic = [NSDictionary dictionary];
    [self getDataAccess];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(void)getDataAccess
{
    
    homeheadViewModel* model = [[homeheadViewModel alloc] init];
    WEAKSELF
    [model handleDataWithSuccess:@"/v1/hometoplist" success:^(NSDictionary *dic) {
        weakSelf.headArr = dic[@"detail"];
        [weakSelf.tableview reloadData];
    } failure:^(NSError *error) {
        NSLog(@"请求失败 error:%@",error.description);
    }];
    [model handleDataWithSuccess:@"/v1/homegrids" success:^(NSDictionary *dic) {
        weakSelf.gridArr = dic[@"detail"];
        [weakSelf.tableview reloadData];
    } failure:^(NSError *error) {
        NSLog(@"请求失败 error:%@",error.description);
    }];
    
    [model handleDataWithSuccess:@"/v1/homescollmsg" success:^(NSDictionary *dic) {
        weakSelf.noticeMsgDic = dic[@"detail"];
        [weakSelf.tableview reloadData];
    } failure:^(NSError *error) {
        NSLog(@"请求失败 error:%@",error.description);
    }];
    
    [model handleDataWithSuccess:@"/v1/homeactivity" success:^(NSDictionary*dic){
        weakSelf.activityArr = dic[@"detail"];
        [weakSelf.tableview reloadData];
    } failure:^(NSError* error){
        NSLog(@"请求失败 error:%@",error.description);
    }];
    
    [model handleDataWithSuccess:@"/v1/homefastbuy" success:^(NSDictionary*dic){
        weakSelf.fastBuyDic = dic[@"detail"];
        [weakSelf.tableview reloadData];
    } failure:^(NSError* error){
        NSLog(@"请求失败 error:%@",error.description);
    }];
    
    [model handleDataWithSuccess:@"/v1/homebrands" success:^(NSDictionary*dic){
        weakSelf.recommendDic = dic[@"detail"];
        [weakSelf.tableview reloadData];
    } failure:^(NSError* error){
        NSLog(@"请求失败 error:%@",error.description);
    }];
    
    [model handleDataWithSuccess:@"/v1/homeJD" success:^(NSDictionary*dic){
        weakSelf.homeJDDic = dic[@"detail"];
        [weakSelf.tableview reloadData];
    } failure:^(NSError* error){
        NSLog(@"请求失败 error:%@",error.description);
    }];
    
    [model handleDataWithSuccess:@"/v1/homeremcommend" success:^(NSDictionary*dic){
        weakSelf.youlikeArr = dic[@"detail"];
        [weakSelf.tableview reloadData];
        [weakSelf.tableview.mj_header endRefreshing];
        
    } failure:^(NSError* error){
        NSLog(@"请求失败 error:%@",error.description);
    }];
    
    //youlikeArr
    
    
    
}

#pragma mark tableviewdelegate
//分栏数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}

//table 表头
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        HomeHeadView * view = [[HomeHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
        [view setData:_headArr];
        view.backgroundColor = [UIColor redColor];
        
        return view;
    }
    else if (section == 1) {
        HomeGridsView *view = [[HomeGridsView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
        [view setData:_gridArr];
        
        return view;
    }
    else if (section == 2)
    {
        HomeMsgNotice* view = [[HomeMsgNotice alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
        [view setData:_noticeMsgDic];
        return view;
    }
    else if(section == 3)
    {
        HomeActivityView* view = [[HomeActivityView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
        [view setData:_activityArr];
        return view;
    }
    else if(section == 4)
    {
        HomeFastBuyView *view = [[HomeFastBuyView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        [view setlabTime:[NSString stringWithFormat:@"%@点场",_fastBuyDic[@"hour"]]];
        [view setlabLiftTime:@"05:00:00"];
        [view setData:_fastBuyDic[@"fastlist"]];
        return view;
    }
    else if (section == 5)
    {
        HomeRecommendView* view = [[HomeRecommendView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
        [view setDataDic:_recommendDic];
        return view;
    }
    else if (section == 6)
    {
        HomeJDView* view = [[HomeJDView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 510)];
        [view setJdDic:_homeJDDic];
        return view;
        
    }
    else if (section == 7)
    {
        HomeYouLikeView* view = [[HomeYouLikeView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 800)];
        [view setArrYoulike:_youlikeArr];
        return view;
    }
    else
    {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2||section == 3||section == 4||section == 7) {
        return 7;
    }
    return 0.01;
}

-(UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2||section == 3||section == 4||section == 7) {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 7)];
        view.backgroundColor=[UIColor lightGrayColor];
        return view;
    }
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    view.backgroundColor=[UIColor blackColor];
    return view;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

//每栏高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 250;
        }
            break;
        case 1:
        {
            return 150;
        }
            break;
        case 2:
        {
            return 170;
        }
            break;
        case 3:
        {
            return 170;
        }
        case 4:
        {
            return 200;
        }
        case 5:
        {
            return 300;
        }
        case 6:
        {
            return 510;
        }
        case 7:
        {
            return 800;
        }
        default:
            return 1;
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 6) {
        return 0;
    }
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
