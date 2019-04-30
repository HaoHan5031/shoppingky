//
//  MyselfViewController.m
//  shopky
//
//  Created by HaoMac on 2018/8/23.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "MyselfViewController.h"
#import "myselfHeadViewModel.h"
#import "myselfHeadView.h"
#import "../view/cell/myselfTableViewCell.h"
#import "DCReceivingAddressViewController.h"
#import "orderViewController.h"

@interface MyselfViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView* tableView;
@property(nonatomic, strong)NSDictionary* infodic;

@end

@implementation MyselfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addOwnViews];
    _infodic = [NSDictionary dictionary];
    
    [self.tableView.mj_header beginRefreshing];
    [self.tableView registerClass:[myselfTableViewCell class] forCellReuseIdentifier:@"myselfTableViewCell"];
    UIView* footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 25)];
    footView.backgroundColor = [UIColor clearColor];
    UILabel *companyLab = [[UILabel alloc] init];
    companyLab.text = @"天津口袋广告有限公司";
    companyLab.textColor = [UIColor darkGrayColor];
    companyLab.font = [UIFont systemFontOfSize:15];
    [footView addSubview:companyLab];
    [companyLab makeConstraints:^(MASConstraintMaker* make){
        make.center.equalTo(footView);
    }];
    self.tableView.tableFooterView = footView;
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [super.navigationController setNavigationBarHidden:YES animated:TRUE];
    
}

-(void)addOwnViews
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getDataAccess)];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker* make){
        make.center.equalTo(self.view);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(kScreenHeight);
    }];
    
}

-(void)getDataAccess
{
    myselfHeadViewModel* model = [[myselfHeadViewModel alloc] init];
    WEAKSELF
    [model handleDataWithSuccess:@"/v1/getuserinfo" success:^(NSDictionary *dic) {
        weakSelf.infodic = dic[@"detail"];
        [weakSelf.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        NSLog(@"请求失败 error:%@",error.description);
        [self.tableView.mj_header endRefreshing];
    }];
}

//显示多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

//每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) { //section组
        return 0;
    }
    else if (section == 1) {
        return 3;
    }
    else
    {
        return 1;
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

//table 表头
-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        myselfHeadView * view = [[myselfHeadView alloc] init];
        
        view.cellSelectBlock = ^(int index)
        {
            orderViewController *vc = [[orderViewController alloc] init];
            vc.title = @"我的订单";
            [vc setVCIndex:index];
            [self.navigationController pushViewController:vc animated:YES];
        };
    
        [view setModel:self.infodic];
        return view;
    }
    else
    {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
        view.backgroundColor = [UIColor grayColor];
        return view;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 200;
    }
    else
        return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* Identifier = @"myselfTableViewCell";
    myselfTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (cell == nil) {
        cell = [[myselfTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    NSInteger group = indexPath.section;
    NSInteger row = indexPath.row;
    switch (group) {
        case 1:
        {
            if (row == 0) {
                [cell setCellContent:@"address" labContent:@"收货地址"];
            }
            else if(row == 1)
            {
                [cell setCellContent:@"kf" labContent:@"我的客服"];
            }
            else
            {
                [cell setCellContent:@"about" labContent:@"关于我们"];
            }
        }
            break;
        case 2:
        {
            [cell setCellContent:@"business" labContent:@"商务合作"];
        }
            
        default:
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"第 %ld 行", indexPath.row + 1);
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 2) {
        SVWebViewController *vc = [[SVWebViewController alloc]initWithAddress:self.infodic[@"shangwu"]];
        vc.title = @"商务合作";
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        if(row == 2)
        {
            SVWebViewController *vc = [[SVWebViewController alloc]initWithAddress:self.infodic[@"about"]];
            vc.title = @"关于我们";
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (row == 1)
        {
            SVWebViewController *vc = [[SVWebViewController alloc]initWithAddress:self.infodic[@"about"]];
            vc.title = @"联系客服";
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            DCReceivingAddressViewController *dcRaVc = [[DCReceivingAddressViewController alloc] init];
            dcRaVc.title = @"地址管理";
            [self.navigationController pushViewController:dcRaVc animated:YES];
        }
    }
    

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
