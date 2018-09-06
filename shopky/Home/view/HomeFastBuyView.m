//
//  HomeFastBuy.m
//  shopky
//
//  Created by HaoMac on 2018/9/2.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeFastBuyView.h"
#import "HomeFastBuyCollectionViewCell.h"
@implementation HomeFastBuyView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnsView];
        _goodsArr = [NSMutableArray array];
    }
    self.backgroundColor = [UIColor whiteColor];
    return self;
}

-(void)addOwnsView 
{
    UIView* leftview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    leftview.backgroundColor = [UIColor redColor];
    [self addSubview:leftview];
    [leftview makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(10);
        make.height.equalTo(30);
    }];
    
    _labTime = [[UILabel alloc] init];
    _labTime.font = [UIFont systemFontOfSize:18];
    [self addSubview:_labTime];
    [_labTime makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(leftview.right).equalTo(3);
        make.centerY.equalTo(leftview);
        
    }];
    
    _labLiftTime = [[UILabel alloc] init];
    _labLiftTime.font = [UIFont systemFontOfSize:15];
    _labLiftTime.textColor = [UIColor redColor];
    [self addSubview:_labLiftTime];
    [_labLiftTime makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.labTime);
        make.left.equalTo(self.labTime.right).equalTo(20);
    }];
    
    _labDesc = [[UILabel alloc] init];
    _labDesc.font = [UIFont systemFontOfSize:10];
    _labDesc.text = @"限时秒杀";
    [self addSubview:_labDesc];
    [_labDesc makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.labTime);
        make.right.equalTo(-25);
    }];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 1;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //滚动方向
    _goodsCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 80) collectionViewLayout:layout];
    _goodsCollectionView.delegate = self;
    _goodsCollectionView.dataSource = self;
    _goodsCollectionView.backgroundColor = [UIColor clearColor];
    _goodsCollectionView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_goodsCollectionView];
    [_goodsCollectionView makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(leftview.bottom);
        make.bottom.equalTo(self).equalTo(-10);
        make.centerX.equalTo(self);
        make.width.equalTo(self);
    }];
    
    [_goodsCollectionView registerClass:[HomeFastBuyCollectionViewCell class] forCellWithReuseIdentifier:@"HomeFastBuyCell"];
}

-(void)setlabTime:(NSString *)time
{
    _labTime.text = time;
}

-(void)setlabLiftTime:(NSString *)lefttiem
{
    _labLiftTime.text = lefttiem;
}

-(void)setData:(NSArray *)arr
{
    for (int i = 0; i< arr.count; i++) {
        homeGoodsModel* model = [[homeGoodsModel alloc] initWithDic:arr[i]];
        [_goodsArr addObject:model];
        
    }
    [_goodsCollectionView reloadData];
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _goodsArr.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"HomeFastBuyCell";
//    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//
//    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    HomeFastBuyCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setCellItem:_goodsArr[indexPath.row]];
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 120);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
