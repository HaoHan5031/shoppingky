//
//  shoppingCarViewController.m
//  shopky
//
//  Created by HaoMac on 2019/3/20.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "shoppingCarViewController.h"
#import "shoppingCarItemTableViewCell.h"
#import "balanceViewController.h"

static NSString* shoppingCarItemTableViewCellID = @"shoppingCarItemTableViewCellID";

@interface shoppingCarViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)NSArray* arrCount;
@property (nonatomic, strong)NSArray* arrOpen;
@property (nonatomic, strong)NSMutableArray * arrMutableCount;
@property (nonatomic, strong)NSMutableArray* arrMutableOpen;
@property (nonatomic, strong)NSMutableArray<shopCarListModel*>* arrItem;
@end

@implementation shoppingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrCount = @[@1,@2,@3,@4,@5,@6];
    _arrOpen = @[@0,@0,@0,@0,@0,@0];
    _arrMutableCount= [NSMutableArray arrayWithArray:_arrCount];
    _arrMutableOpen= [NSMutableArray arrayWithArray:_arrOpen];
    _arrItem = [NSMutableArray array];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [_tableView registerClass:[shoppingCarItemTableViewCell class] forCellReuseIdentifier:shoppingCarItemTableViewCellID];
    _arrItem = [[Singleton shareInstance] queryShopCarInfo];
    // Do any additional setup after loading the view.
}

-(UITableView*)tableView
{
    int barTop = self.tabBarController.tabBar.bounds.size.height;
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-barTop) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
        [self.view addSubview:_tableView];

    }
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    view.backgroundColor = [UIColor whiteColor];
    _tableView.tableHeaderView = view;
    return _tableView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [super.navigationController setNavigationBarHidden:YES animated:TRUE];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_arrItem count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    shoppingCarItemTableViewCell *cell = (shoppingCarItemTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    return [shoppingCarItemTableViewCell getHight:_arrItem[indexPath.section].count isOpen:[_arrMutableOpen[indexPath.section]intValue]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blackColor];
    
    return view;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    shoppingCarItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shoppingCarItemTableViewCellID forIndexPath:indexPath];
    if (!cell) {
        cell = [[shoppingCarItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shoppingCarItemTableViewCellID];
    }
    cell.isOpen = [_arrMutableOpen[indexPath.section] intValue];
    [cell setCount:_arrItem[indexPath.section].count];
    [cell setModel:_arrItem[indexPath.section]];
    cell.index = indexPath.section;
    cell.delItem = ^(NSInteger count){
        if (count == 0) {
            [_arrItem removeObjectAtIndex:indexPath.section];
        }
        else
        {
            _arrItem[indexPath.section].count = [NSNumber numberWithInteger:count];
            
        }
        [tableView reloadData];
        
    };
    cell.pushVC = ^(){
        balanceViewController *vc = [[balanceViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    };
    
    cell.openCell = ^(NSInteger count, BOOL isopen){
//        _arrMutableCount[indexPath.section] = [NSNumber numberWithInteger:count];
        _arrMutableOpen[indexPath.section] = [NSNumber numberWithInteger:isopen];
        [tableView reloadData];
    };
    
    return cell;
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
