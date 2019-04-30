//
//  goodDetialViewController.m
//  shopky
//
//  Created by HaoMac on 2019/3/14.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "goodDetialViewController.h"
#import "goodDetialHeadView.h"
#import "bottomAddShoppingCarView.h"
#import "YeeShopCarHelp.h"
#import "balanceViewController.h"
#import "goodDetailModel.h"
#import "goodDetailViewModel.h"


@interface goodDetialViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    int oldNum;
    int newNum;
}
@property(nonatomic, strong)goodDetialHeadView* headView;
@property(nonatomic, strong)bottomAddShoppingCarView* bottomView;
@property(nonatomic, strong)goodDetailModel* goodModel;

@end

@implementation goodDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bottomView = [[bottomAddShoppingCarView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_bottomView];
    [_bottomView makeConstraints:^(MASConstraintMaker* make){
        make.bottom.equalTo(self.view.bottom);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(100);
    }];
    _bottomView.balance_action = ^(){
        balanceViewController* vc = [[balanceViewController alloc] init];
        [self.navigationController pushViewController:vc animated:TRUE];
        
    };
    
    UITableView* tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    oldNum = 0;
    
    [tableview makeConstraints:^(MASConstraintMaker* make){
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(20);
        make.bottom.equalTo(_bottomView.top);
        make.width.mas_equalTo(kScreenWidth);
//        make.height.mas_equalTo(SafeAreaHeightWithBottom);
    }];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
//    UIView* view  = [[UIView alloc] initWithFrame:CGRectMake(0, 100, kScreen_WIDTH, 100)];
//    view.backgroundColor= [UIColor redColor];
//    [self.view addSubview:view];
}

-(void)press2
{
    NSLog(@"press2");
}

-(void)press3
{
    NSLog(@"press3");
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(void)setGoodID:(int)goodID
{
    _goodID = goodID;
    [self getGoodData];
}

-(void)setShopID:(NSString *)shopID
{
    _shopID = shopID;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 0.0001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat h = (kScreenHeight / 8.0)*7.0;
    return h;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    goodDetialHeadView* headView = [[goodDetialHeadView alloc] init];
    headView.closeview = ^(){
        [self dismissViewControllerAnimated:true completion:nil];
    };
    WEAKSELF
    headView.addgood = ^(NSInteger number, BOOL increaseStatus)
    {
//        [weakSelf.bottomView setbageNum:number];
        if (number== 1 && increaseStatus) {
            shopcarDBModel * model = [[shopcarDBModel alloc] init];
            model.shopId = weakSelf.shopID;
            model.goodsId = [NSString stringWithFormat:@"%d",weakSelf.goodModel.goods_id] ;
            model.goodsName = weakSelf.goodModel.title;
            model.count = 1;
            model.price = [NSString stringWithFormat:@"%02f",weakSelf.goodModel.price];
            model.shopName = weakSelf.goodModel.shop_name;
            [[Singleton shareInstance] insertGoodsData:model];
        }
        if (number > 1 && increaseStatus) {
            shopcarDBModel * model = [[shopcarDBModel alloc] init];
            model.shopId = weakSelf.shopID;
            model.goodsId = [NSString stringWithFormat:@"%d",weakSelf.goodModel.goods_id] ;
            model.goodsName = weakSelf.goodModel.title;
            model.count = (int)number;
            model.price = [NSString stringWithFormat:@"%02f",weakSelf.goodModel.price];
            model.shopName = weakSelf.goodModel.shop_name;
            [[Singleton shareInstance] updateGoodsData:model newModel:model];
        }
        if (!increaseStatus && number!=0) {
            shopcarDBModel * model = [[shopcarDBModel alloc] init];
            model.shopId = weakSelf.shopID;
            model.goodsId = [NSString stringWithFormat:@"%d",weakSelf.goodModel.goods_id] ;
            model.goodsName = weakSelf.goodModel.title;
            model.count = (int)number;
            model.price = [NSString stringWithFormat:@"%02f",weakSelf.goodModel.price];
            model.shopName = weakSelf.goodModel.shop_name;
            [[Singleton shareInstance] updateGoodsData:model newModel:model];
        }
        if (number == 0) {
            shopcarDBModel * model = [[shopcarDBModel alloc] init];
            model.shopId = weakSelf.shopID;
            model.goodsId = [NSString stringWithFormat:@"%d",weakSelf.goodModel.goods_id] ;
            [[Singleton shareInstance] deleteGoodsData:model];
        }
        
        if (increaseStatus) {
            [weakSelf.bottomView setaddbageNum:1];
        }
        else
        {
            [weakSelf.bottomView setdelbageNum:1];
        }
    };
    
    _headView = headView;
    return headView;
}

-(void)getGoodData
{
    WEAKSELF
    NSDictionary* userinfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_info"];
    NSDictionary* param = @{@"user_id":userinfo[@"user_id"], @"goods_id":[NSString stringWithFormat:@"%d",_goodID]};
    goodDetailViewModel* model = [[goodDetailViewModel alloc] init];
    [model handleDataWithSuccess:@"/Index/goods_info" param:param success:^(NSDictionary * _Nonnull dic) {
        NSLog(@"%@", dic);
        weakSelf.goodModel = [[goodDetailModel alloc] initWithDic:dic[@"data"][@"goods_info"]];
        [weakSelf.headView setHeadModel:dic[@"data"][@"goods_info"]];
        
        shopcarDBModel* model = [[Singleton shareInstance] getOneGoodsInfo:
                                 weakSelf.shopID goodsid:[NSString stringWithFormat:@"%d",weakSelf.goodID]];
        if (model) {
            [weakSelf.bottomView setbageNum:model.count];
            [weakSelf.headView.addButton setCurrentNumber:model.count];
        }
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

@end
