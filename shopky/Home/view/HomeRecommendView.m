//
//  HomeRecommendView.m
//  shopky
//
//  Created by HaoMac on 2018/9/3.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeRecommendView.h"
#import "HomeReccomendCollectionViewCell.h"
@implementation HomeRecommendView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnsView];
        _dataDic = [NSDictionary dictionary];
        _productArr = [NSArray array];
    }
    return self;
}

-(void)addOwnsView
{
    _image_top = [[UIImageView alloc] init];
    _image_top.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_image_top];
    [_image_top makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self);
        make.centerX.equalTo(self);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(100);
    }];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 1;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //滚动方向
    _recProductCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120) collectionViewLayout:layout];
    _recProductCollection.delegate = self;
    _recProductCollection.dataSource = self;
    _recProductCollection.backgroundColor = [UIColor clearColor];
    _recProductCollection.showsHorizontalScrollIndicator = NO;
    [self addSubview:_recProductCollection];
    [_recProductCollection makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.image_top.bottom);
        make.centerX.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(120);
    }];
    [_recProductCollection registerClass:[HomeReccomendCollectionViewCell class] forCellWithReuseIdentifier:@"ReccomendCollectionViewCellID"];
    
    _recSDCycleScrollView = [[SDCycleScrollView alloc] init];
    [self addSubview:_recSDCycleScrollView];
    [_recSDCycleScrollView makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.recProductCollection.bottom);
        make.width.equalTo(kScreenWidth);
        make.bottom.equalTo(self);
    }];
}
-(void)setDataDic:(NSDictionary *)dataDic
{
    _dataDic = dataDic;
    [_image_top sd_setImageWithURL:_dataDic[@"Recomend_Top"][@"brand_image"]];
    NSArray* arrTemp = _dataDic[@"Recomend_Product"];
    NSMutableArray* arr = [NSMutableArray array];
    for (int i = 0; i < arrTemp.count; i++) {
        [arr addObject:arrTemp[i][@"brand_image"]];
    }
    [_recSDCycleScrollView setImageURLStringsGroup:arr];
    _productArr = _dataDic[@"Recomend_Scorll"];
    [_recProductCollection reloadData];
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _productArr.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ReccomendCollectionViewCellID";
    //    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    //
    //    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    HomeReccomendCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setImageUrl:_productArr[indexPath.row][@"brand_image"]];
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
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
