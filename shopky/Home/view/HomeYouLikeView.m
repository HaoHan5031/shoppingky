//
//  HomeYouLikeView.m
//  shopky
//
//  Created by HaoMac on 2018/9/5.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeYouLikeView.h"
#import "HomeFastBuyCollectionViewCell.h"
#import "HomeYouLikeLayout.h"
@implementation HomeYouLikeView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnView];
        _arrYoulike = [NSMutableArray array];
        
    }
    return self;
}
-(void)addOwnView
{
    
    UIView* topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:topView];
    [topView makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self);
        make.top.equalTo(self);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(40);
    }];
    
    UIImageView* image_Tog = [[UIImageView alloc] init];
    image_Tog.contentMode = UIViewContentModeScaleAspectFit;
    [image_Tog sd_setImageWithURL:[NSURL URLWithString:@"http://gfs7.gomein.net.cn/T1WudvBm_T1RCvBVdK.png"]];
    [topView addSubview:image_Tog];
    [image_Tog makeConstraints:^(MASConstraintMaker* make){
        make.center.equalTo(topView);
        make.size.equalTo(CGSizeMake(150, 30));
    }];
    
    HomeYouLikeLayout *layout = [HomeYouLikeLayout new];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 800) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor redColor];
//    _collectionView.showsHorizontalScrollIndicator = NO;
//    _collectionView.showsVerticalScrollIndicator = NO;
    [self addSubview:_collectionView];
    [_collectionView makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self);
        make.top.equalTo(topView.bottom);
        make.bottom.equalTo(self);
        make.width.equalTo(kScreenWidth);
    }];
    [_collectionView registerClass:[HomeFastBuyCollectionViewCell class] forCellWithReuseIdentifier:@"YouLikeCollectionViewCellID"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderReusableView"]; //注册头部
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterReusableView"]; //注册尾部
    
    
}

-(void)setArrYoulike:(NSMutableArray *)arrYoulike
{
    for (int i = 0; i< arrYoulike.count; i++) {
        homeGoodsModel* model = [[homeGoodsModel alloc] initWithDic:arrYoulike[i]];
        [_arrYoulike addObject:model];
        
    }
    [_collectionView reloadData];
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _arrYoulike.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"YouLikeCollectionViewCellID";
    HomeFastBuyCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setCellItem:_arrYoulike[indexPath.row]];
    return cell;
}



#pragma mark --UICollectionViewDelegateFlowLayout
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderReusableView" forIndexPath:indexPath];
        return headerView;
        
    } else if (kind == UICollectionElementKindSectionFooter) {
        
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FooterReusableView" forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor clearColor];
        return footerView;
    }
    
    return [UICollectionReusableView new];
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
