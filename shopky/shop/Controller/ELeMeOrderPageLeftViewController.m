//
//  ELeMeOrderPageLeftViewController.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ELeMeOrderPageLeftViewController.h"
#import "ELeMeOrderPageViewMainController.h"
#import "ELeMeOrderPageLeftVCCell.h"
#import "shopViewModel.h"

@interface ELeMeOrderPageLeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)LWGesturePenetrationTableView *rightTableView;
@property(nonatomic, strong)UITableView *leftTableView;
@property(nonatomic, strong)NSArray* arrLeft;
@property(nonatomic, strong)NSMutableArray* arrRight;
@property(nonatomic, strong)NSMutableArray<shopcarDBModel*>* arrDBModel;
@end

@implementation ELeMeOrderPageLeftViewController
{
    BOOL _rightTVScrollUp;
   
    CGFloat _oldRightOffsetY;
    BOOL _didSelectLeftTVCell;//选中左边tableView cell
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrLeft = [NSArray array];
    _arrRight = [NSMutableArray array];
    _arrDBModel = [NSMutableArray array];
    [self putTogetheraddSubViews];
//    [self getShopData];
}

-(void)getShopData
{
    shopViewModel* model = [[shopViewModel alloc] init];
    NSDictionary* userinfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_info"];
    NSDictionary* param = @{@"user_id":userinfo[@"user_id"], @"shop_id":_shopID};
    WEAKSELF
    [model handleDataWithSuccess:@"/Index/shop_index_elm" param:param success:^(NSDictionary *dic) {
        if ([dic[@"code"] intValue] == 1) {
            weakSelf.shopName = dic[@"data"][@"shop_info"][@"shop_name"];
            NSLog(@"%@", dic[@"data"][@"cat_list"]);
            weakSelf.arrLeft = dic[@"data"][@"cat_list"];
            for (int i = 0; i<weakSelf.arrLeft.count; i++) {
                int n = [weakSelf.arrLeft[i][@"goods_cat_id"] intValue];
                [weakSelf.arrRight addObject:dic[@"data"][@"shop_cat"][[NSString stringWithFormat:@"%d",n]]];
            }
            weakSelf.arrDBModel = [[Singleton shareInstance] getShopCarGoodsInfo:weakSelf.shopID];
            int bottom_count = 0;
            for (int i = 0; i<_arrDBModel.count; i++) {
                shopcarDBModel* model = [_arrDBModel objectAtIndex:i];
                bottom_count += model.count;
            }
            
            if (bottom_count > 0) {
                if (_setBottomCount) {
                    _setBottomCount(bottom_count);
                }
            }
            
            [self.rightTableView reloadData];
            [self.leftTableView reloadData];
        }
        else
        {
            
        }
    } failure:^(NSError *error) {
        NSLog(@"请求失败 error:%@",error.description);
    }];
    
}

#pragma mark --- UI ---
/**
 组装视图
 */
-(void)putTogetheraddSubViews
{
   __weak __typeof(self) weekSelf = self;
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
    self.leftTableView.backgroundColor = [UIColor greenColor];
    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(90);
    }];
    [self.rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(weekSelf.leftTableView.mas_right).with.offset(0);
        make.right.mas_equalTo(0);
    }];
}
#pragma mark - UI懒加载
-(LWGesturePenetrationTableView *)rightTableView
{
    if (!_rightTableView) {
        _rightTableView = [[LWGesturePenetrationTableView alloc]init];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        
        [_rightTableView registerClass:[ELeMeOrderPageLeftVCRightCell class] forCellReuseIdentifier:@"cell2"];
    }
    return _rightTableView;
}

-(UITableView *)leftTableView
{
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        
        [_leftTableView registerClass:[ELeMeOrderPageLeftVCLeftCell class] forCellReuseIdentifier:@"cell1"];
    }
    return _leftTableView;
}
#pragma mark --- set ---
-(void)setOrderFoodModel:(OrderFoodModel *)orderFoodModel
{
//    _orderFoodModel = orderFoodModel;
//    [self.rightTableView reloadData];
//    [self.leftTableView reloadData];
//    if (_orderFoodModel.menuTypesModelArr.count>0) {
//        NSIndexPath *targetIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [_leftTableView selectRowAtIndexPath:targetIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
//    }
}

-(void)setShopID:(NSString *)shopID
{
    _shopID = shopID;
    [self getShopData];
}


#pragma mark --- UIScrollViewDelegate ---

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    ELeMeOrderPageViewMainController *vc = (ELeMeOrderPageViewMainController *)[self parentViewController];//父控制器
    
//    NSLog(@"aaaaaaaaaaaaaa=====%f",scrollView.contentOffset.y);
    if (scrollView==self.rightTableView&&!_didSelectLeftTVCell) {
        if (scrollView.contentOffset.y <= 0) {//rightTableView不能小于最小值（不能下滑的条件）
            self.offsetType = OffsetTypeMin;
            scrollView.contentOffset =CGPointZero;
        } else {
            self.offsetType = OffsetTypeCenter;
        }
        
        
        //联动逻辑：rightTableViews顶部section头消失出现 实现 leftTableView选择联动
        if (scrollView.contentOffset.y>_oldRightOffsetY) {
            _rightTVScrollUp = YES;
            _rightTVScrollDown =  !_rightTVScrollUp;
            
        } else if (scrollView.contentOffset.y<_oldRightOffsetY)
        {
            _rightTVScrollUp = NO;
            _rightTVScrollDown =  !_rightTVScrollUp;
        }

        
        if (vc.offsetType != OffsetTypeMax&&_rightTVScrollUp) {//vc.offsetType!= OffsetTypeMax  时rightTableView不能向上滑动（不能上滑的条件）
            scrollView.contentOffset = CGPointMake(0, _oldRightOffsetY);
        
        }
        if (vc.offsetType == OffsetTypeMax) {
            
        }
        
        
        _oldRightOffsetY = floorf(scrollView.contentOffset.y);
    }
    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (scrollView==self.rightTableView) {
        _didSelectLeftTVCell = NO;
        _oldRightOffsetY = floorf(scrollView.contentOffset.y);
    }
}
//代理UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger num;
    if (tableView==self.leftTableView) {
         num = 1;
    }
    else
    {
        num = _arrLeft.count;
    }
        return num;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num;
    if (tableView==self.leftTableView) {
          num = _arrLeft.count;
    }
    else
    {
        
        NSArray *arr = _arrRight[section][@"goods_list"];
        num = arr.count;
    }
    
    return num;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==self.leftTableView) {
       
       ELeMeOrderPageLeftVCLeftCell *leftCell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        leftCell.backgroundColor = [UIColor colorWithHexString:@"e6e6e6"];
        leftCell.text = _arrLeft[indexPath.row][@"goods_cat_title"];
        UIView *selectedBackgroundView = [[UIView alloc]init];
        UIView *lineVView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, 48)];
        lineVView.backgroundColor = UIColor_0398ff;
        selectedBackgroundView.backgroundColor = [UIColor whiteColor];
        [selectedBackgroundView addSubview:lineVView];
        leftCell.selectedBackgroundView = selectedBackgroundView;
        return leftCell;
    }
    else
    {
        
        ELeMeOrderPageLeftVCRightCell *rightCell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        rightCell.isFirst = YES;
        rightCell.selectionStyle =  UITableViewCellSelectionStyleNone;
        rightCell.backgroundColor=[UIColor whiteColor];
        
        //
        NSDictionary *menuModel = self.arrRight[indexPath.section][@"goods_list"][indexPath.row];
//        [menuModel setValue:_shopID forKey:@"shopid"];
        if (_arrDBModel) {
            for (int i = 0; i < _arrDBModel.count; i++)
            {
                shopcarDBModel* model = [_arrDBModel objectAtIndex:i];
                if ([model.goodsId intValue] == [[menuModel objectForKey:@"goods_id"] intValue]) {
                    [rightCell setAddbuttonNum:model.count];
                }
            }
        }
        [rightCell setModelData:(NSDictionary*)menuModel];
        [rightCell setShopId:_shopID];
        [rightCell setShopName:_shopName];

        rightCell.addBlock = ^(CGRect cellBtnRect, NSInteger shopNumChange, BOOL increaseStatus) {
            ELeMeOrderPageViewMainController *vc = (ELeMeOrderPageViewMainController *)[self parentViewController];//父控制器
            [vc addItemToCar:shopNumChange Rect:cellBtnRect Status:increaseStatus];
        };
        
        return rightCell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    if (tableView==self.rightTableView) {
        NSString* head = _arrRight[section][@"goods_cat_title"];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, ScreenWidth-10, 20)];
        [view addSubview:lable];
        lable.font = [UIFont systemFontOfSize:11];
        lable.textColor = UIColor_333333;
        lable.text = head;
    }
    
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return view;
}
//行高 Footer
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = tableView == self.leftTableView ? 48 : 79;
    return rowHeight;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat headerHeight = tableView == self.rightTableView ? 20 : 0.01;
    return headerHeight;
}

#pragma mark -  leftTableView rightTableView实现联动 : rightTableViews顶部section头消失出现 实现 leftTableView选择联动
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.leftTableView) {
        [self scrollRightTableViewWhenSelectRowInLeftTableViewAtIndexPath:indexPath];
        _didSelectLeftTVCell = YES;
    }
    else
    {
        if (_cellSelectBlock) {
            int goodid = [_arrRight[indexPath.section][@"goods_list"][indexPath.row][@"goods_id"] intValue];
            _cellSelectBlock(goodid);
        }
    }
}

-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
    if (!_didSelectLeftTVCell&&tableView==self.rightTableView&&_rightTVScrollUp) {
        NSIndexPath *targetIndexPath = [NSIndexPath indexPathForRow:section+1 inSection:0];
        if ((section+1)<_orderFoodModel.menuTypesModelArr.count) {
            [_leftTableView selectRowAtIndexPath:targetIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        }
        
    }
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section
{
    if (!_didSelectLeftTVCell&&tableView==self.rightTableView&&_rightTVScrollDown) {
        NSIndexPath *targetIndexPath = [NSIndexPath indexPathForRow:section inSection:0];
        [_leftTableView selectRowAtIndexPath:targetIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
//
}


#pragma mark -
-(void)scrollRightTableViewWhenSelectRowInLeftTableViewAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.row;
    NSIndexPath *targetIndexPath = [NSIndexPath indexPathForRow:NSNotFound inSection:section];
    [_rightTableView scrollToRowAtIndexPath:targetIndexPath atScrollPosition: UITableViewScrollPositionTop animated:YES];
}

@end
