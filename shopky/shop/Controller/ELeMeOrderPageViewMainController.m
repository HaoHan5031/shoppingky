//
//  ELeMeOrderPageViewController.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/10.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ELeMeOrderPageViewMainController.h"
#import "shopHeaderView.h"
#import "goodDetialViewController.h"
#import "bottomAddShoppingCarView.h"
#import "balanceViewController.h"
#import "YeeShopCarHelp.h"
#define TableHeaderViewH  120

//子视图
#import "ELeMeOrderPageLevelListView.h"
//子控制器
#import "ELeMeOrderPageLeftViewController.h"
#import "ELeMeOrderPageRightViewController.h"
#import "UIViewController+XPModal.h"
#import "OrderFoodModel.h"
@interface ELeMeOrderPageViewMainController ()<UITableViewDelegate,UITableViewDataSource,ELeMeOrderPageLevelListViewDelegate>
@property(nonatomic, strong)UITableView *mainTableView;//主tableView
@property(nonatomic, strong)UIScrollView *subScrollView;//添加到cell的滚动视图 实现 “点菜” “商家滑动切换”
@property(nonatomic, strong)ELeMeOrderPageLeftViewController *subLeftVC;//点菜控制器
@property(nonatomic, strong)ELeMeOrderPageRightViewController *subRightVC;//商家控制器
@property(nonatomic, strong)ELeMeOrderPageLevelListView *levelListView;//section头视图
@property(nonatomic, strong)OrderFoodModel *foodModel;
@property(nonatomic, strong)bottomAddShoppingCarView* bottomView;

@end

@implementation ELeMeOrderPageViewMainController
{
    CGFloat _mainTableViewOldOffSet;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
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
    
    [self putTogetheraddSubViews];
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"OrderShamData" ofType:@"plist"];
    NSArray *dataArr = [NSArray arrayWithContentsOfFile:dataPath];
    self.foodModel = [[OrderFoodModel alloc]init];
   
    [_foodModel getMenuTypesModelFromDataArr:dataArr];
     NSLog(@"%@",self.foodModel.menuTypesModelArr);
    self.subLeftVC.orderFoodModel = _foodModel;
    self.subLeftVC.shopID = _shopID;
    
    
}

-(void)setShopID:(NSString *)shopID
{
    _shopID = shopID;
    
}

-(void)addItemToCar:(NSInteger)num Rect:(CGRect)rect Status:(BOOL) increaseStatus
{
    
    if (increaseStatus) {
        [_bottomView setaddbageNum:1];
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect toRect = [self.bottomView.logoImg convertRect:self.bottomView.logoImg.bounds toView:window];
        UIImage *object =[UIImage imageNamed:@"increase_meituan"];
        
        [YeeShopCarHelp ShowCarAnimationFromPoint:
         CGPointMake(rect.origin.x+object.size.width*0.5, rect.origin.y+object.size.height*0.5)
                                          ToPoint:CGPointMake(CGRectGetMidX(toRect), CGRectGetMidY(toRect))
                                           object:[UIImage imageNamed:@"increase_meituan"]
                                         duration:.5 inView:self.view completion:^(BOOL finished) {
                                             
                                         }];
    }
    else{
        [_bottomView setdelbageNum:1];
    }
    
}

#pragma mark - UI设置
/**
 组装视图 
 */
-(void)putTogetheraddSubViews
{
    WEAKSELF
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.mainTableView];
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker* make){
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(SafeAreaTopHeight);
        make.width.mas_equalTo(kScreenWidth);
        make.bottom.mas_equalTo(weakSelf.bottomView.top);
    }];
}

/**
 UI懒加载
 */
-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        CGRect frame = self.view.bounds;
        frame.origin.y = 64;
        frame.size.height -= 64;
        _mainTableView.frame = frame;
        _mainTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mainTableView.backgroundColor = [UIColor clearColor];
        _mainTableView.showsVerticalScrollIndicator = NO;
//        [_mainTableView makeConstraints:^(MASConstraintMaker* make){
//            make.
//        }];
        
        //设置代理
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        //设置头视图
//        _mainTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, TableHeaderViewH)];
        
//        UIView* headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, TableHeaderViewH)];
//        headview.backgroundColor = [UIColor redColor];
//        headview.tag = 200;
        shopHeaderView* headview = [[shopHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TableHeaderViewH)];
        headview.backgroundColor = [UIColor clearColor];
        headview.tag = 200;
        _mainTableView.tableHeaderView = headview;
        
//        _mainTableView.tableHeaderView.backgroundColor =  [UIColor clearColor];
        
    }
    return _mainTableView;
}

-(UIScrollView *)subScrollView
{
    
    if (!_subScrollView) {
        CGRect frame = self.view.bounds;
        frame.origin.y = 0;
        frame.size.height -= 109;
        _subScrollView = [[UIScrollView alloc]initWithFrame:frame];
        _subScrollView.contentSize = CGSizeMake(ScreenWidth*2, frame.size.height);
        _subScrollView.backgroundColor = [UIColor grayColor];
        _subScrollView.pagingEnabled = YES;
        _subScrollView.delegate = self;
        _subScrollView.bounces = NO;
        [_subScrollView addSubview:self.subLeftVC.view];
        [_subScrollView addSubview:self.subRightVC.view];
        self.subLeftVC.view.backgroundColor = [UIColor redColor];
        self.subRightVC.view.backgroundColor = [UIColor blueColor];
        self.subLeftVC.setBottomCount = ^(NSInteger num)
        {
            [_bottomView setbageNum:num];
        };
        self.subLeftVC.cellSelectBlock = ^(NSInteger shopNumChange)
        {
            XPModalConfiguration *configuration = [XPModalConfiguration defaultConfiguration];
            CGSize contentSize;
            configuration.direction = XPModalDirectionBottom;
            configuration.enableInteractiveTransitioning = YES;
            configuration.enableBackgroundAnimation = YES;
            configuration.backgroundColor = [UIColor purpleColor];
            contentSize = CGSizeMake(CGFLOAT_MAX, kScreenHeight);
            goodDetialViewController *vc = [[goodDetialViewController alloc] init];
            [vc setGoodID:shopNumChange];
            [vc setShopID:_shopID];
            vc.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:vc animated:TRUE];
            
//            vc.view.backgroundColor = [UIColor whiteColor];
//            [self presentModalWithViewController:vc contentSize:contentSize configuration:configuration completion:nil];
//            UIView *view = [[UIView alloc] init];
//            view.backgroundColor = [UIColor redColor];
//            [self presentModalWithView:view contentSize:contentSize configuration:configuration completion:nil];
            
        };

    }
    return _subScrollView;
}

-(ELeMeOrderPageLevelListView *)levelListView
{
    if (!_levelListView) {
        _levelListView = [[ELeMeOrderPageLevelListView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        _levelListView.delegate = self;
    }
    return _levelListView;
}

-(ELeMeOrderPageLeftViewController *)subLeftVC
{
    if (!_subLeftVC) {
        _subLeftVC = [[ELeMeOrderPageLeftViewController alloc]init];
        _subLeftVC.view.frame = self.subScrollView.bounds;
        
        [self addChildViewController:_subLeftVC];
        
    }
    return _subLeftVC;
}

-(ELeMeOrderPageRightViewController *)subRightVC
{
    if (!_subRightVC) {
        CGRect frame = self.subScrollView.bounds;
        frame.origin.x = ScreenWidth;
        _subRightVC = [[ELeMeOrderPageRightViewController alloc]init];
          _subRightVC.view.frame =frame;
        [self addChildViewController:_subRightVC];
    }
    return _subRightVC;
}

#pragma mark - delegate实现

/**
 ELeMeOrderPageLevelListViewDelegate
 */
-(void)selectedButton:(BOOL)isLeftButton
{
    CGPoint offSet = _subScrollView.contentOffset;
    
    
    offSet.x = isLeftButton ? 0 : ScreenWidth;
    
    [_subScrollView setContentOffset:offSet animated:YES];
}
/**
 UIScrollViewDelegate
 */


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if ([scrollView isEqual:self.mainTableView]) {
//        
//        NSLog(@"%lf, %lf", scrollView.contentOffset.y, scrollView.contentSize.height-scrollView.bounds.size.height);
        
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height-scrollView.bounds.size.height-0.5)) {//mainTableView 滚动不能超过最大值
            self.offsetType = OffsetTypeMax;
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, scrollView.contentSize.height-scrollView.bounds.size.height);//(scrollView.contentSize.height-scrollView.bounds.size.height):mainTableView 可以滚动的最大偏移距离 超过等于最大偏移距离 不可以再向上滑动
             _mainTableViewOldOffSet = scrollView.contentSize.height-scrollView.bounds.size.height;
        } else if (scrollView.contentOffset.y <= 0) {
            self.offsetType = OffsetTypeMin;
            
        } else {
            self.offsetType = OffsetTypeCenter;
            
        }
        
       
       
        if ((self.levelListView.selectedIndex == 0 && self.subLeftVC.offsetType != OffsetTypeMin)&&(self.subLeftVC.rightTVScrollDown||(scrollView.contentOffset.y-_mainTableViewOldOffSet<0))) {//self.subLeftVC.offsetType != OffsetTypeMin时_mainTableView不能向下滑动（注释：当点菜页面显示并且商品列表tableView未达到最大偏移量之前，mainTableView不能向下滑动 ）
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, _mainTableViewOldOffSet);
        }
        
      
        if (self.levelListView.selectedIndex == 1 &&self.subRightVC.offsetType != OffsetTypeMin) {//当商家页面显示时，商家信息tableview偏移量不是最小状态 说明mainTableView 已经滚动到了最大值 在商家信息tableview偏移量未达到最小偏移量之前  mainTableView需要保持原来的偏移量不变
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, _mainTableViewOldOffSet);
        }
        
        _mainTableViewOldOffSet = scrollView.contentOffset.y;
        UIView* headview = [self.view viewWithTag:200];
        if (_mainTableViewOldOffSet > 0) {
            float al = 0.0;
            if (_mainTableViewOldOffSet > 100) {
                al = 0;
            }
            else
            {
                al = (100 - _mainTableViewOldOffSet)/100.0;
            }
            headview.alpha = al;
        }
        
//        float al = 1.0 - _oldRightOffsetY/100;
//        headview.alpha = al;
        
    }
    
    if ([scrollView isEqual:self.subScrollView]) {
        [self.levelListView changeLineViewOffsetX:self.subScrollView.contentOffset.x];
    }
    
    
}

/**
 UITableViewDataSource
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger sectionNum = 1;
    return sectionNum;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowNum = 1;
    
    return rowNum;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.subScrollView removeFromSuperview];
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    [cell.contentView addSubview:self.subScrollView];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
/**
 UITableViewDelegate
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = self.subScrollView.bounds.size.height;
    return rowHeight;
}

//分区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat headerHeight = self.levelListView.bounds.size.height;
    return headerHeight;
}
//分区脚高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat footerHeight;
    return footerHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.levelListView;
}

@end
