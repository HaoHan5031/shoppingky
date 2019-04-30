//
//  LTPageViewTestOneVC.m
//  OCExample
//
//  LTPageViewTestOneVC.m
//  OCExample
//
//  Created by 高刘通 on 2018/4/19.
//  Copyright © 2018年 LT. All rights reserved.
//
//  如有疑问，欢迎联系本人QQ: 1282990794
//
//  ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC/Swift
//
//  github地址: https://github.com/gltwy/LTScrollView
//
//  clone地址:  https://github.com/gltwy/LTScrollView.git
//

#import "HomeCollectSelectVC.h"
#import "LTScrollView-Swift.h"
#import "../view/cell/HomeCollectTableViewCell.h"
#import "ELeMeOrderPageViewMainController.h"


#define kIPhoneX ([UIScreen mainScreen].bounds.size.height == 812.0)

@interface HomeCollectSelectVC () <UITableViewDelegate, UITableViewDataSource, AMapLocationManagerDelegate>

@property(strong, nonatomic) UITableView *tableView;


@end

@implementation HomeCollectSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor clearColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNewDataMore)];
    self.tableView.estimatedRowHeight = 120;
    _tableView.mj_header.automaticallyChangeAlpha = YES;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[HomeCollectTableViewCell class] forCellReuseIdentifier:@"HomeCollectTableViewCell"];
    [self.tableView makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view);
        make.width.equalTo(kScreenWidth-60*Parameter);
        make.height.equalTo(self.view.bounds.size.height);
    }];
    
//    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"user_info"];
    
#warning 重要 必须赋值
    self.glt_scrollView = self.tableView;
//    [self initCompleteBlock];
//    [self configLocationManager];
//    //进行单次带逆地理定位请求
//    [self.locationManager requestLocationWithReGeocode:YES completionBlock:self.completionBlock];
//    [self setupRefreshData];
}


-(void)setShoparr:(NSMutableArray *)shoparr
{
    _shoparr = shoparr;
    [self.tableView.mj_header beginRefreshing];
}

-(void)setShoptag:(NSInteger)shoptag
{
    _shoptag = shoptag;
}

- (void)setupRefreshData {
    
    [self.tableView.mj_header beginRefreshing];
    
}

-(void)loadNewData
{
//    ss = self.tableView.mj_header.state;
//    MJRefreshNormalHeader* head = self.tableView.mj_header;
    [self.tableView.mj_header endRefreshing];
    
    
//    [self.tableView reloadData];
}

-(void)loadNewDataMore
{
//    [self.tableView.mj_footer beginRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shoparr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    HomeCollectTableViewCell *cell = [ShopTableViewCell cellWithTableView:tableView
//                                                   reuseIdentifier:[NSString stringWithFormat:@"ShopTableViewCell_%ld", (long)indexPath.row]];
//    [cell setViewData:_shoparr[indexPath.row]];
    HomeCollectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"ShopTableViewCell_%ld", (long)_shoptag]];
    
    if (cell == nil) {
        cell = [[HomeCollectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"ShopTableViewCell_%ld", (long)indexPath.row]];
    }
    [cell setViewData:_shoparr[indexPath.row]];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ELeMeOrderPageViewMainController *rootVC = [[ELeMeOrderPageViewMainController alloc]init];
    long shop_id = [_shoparr[indexPath.row][@"shop_id"] intValue];
    [rootVC setShopID:[NSString stringWithFormat:@"%ld", shop_id]];
    [self.navigationController pushViewController:rootVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 522.0f*Parameter;
}

//- (UITableView *)tableView {
//    if (!_tableView) {
//        CGFloat H = kIPhoneX ? (self.view.bounds.size.height - 64 - 24 - 34) : self.view.bounds.size.height - 64;
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, H)];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//    }
//    return _tableView;
//}

@end
