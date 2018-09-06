//
//  HomeJDView.m
//  shopky
//
//  Created by HaoMac on 2018/9/4.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeJDView.h"
#import "HomeJDCollectionViewCell.h"
#import "HomeJDLayout.h"
@implementation HomeJDView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnsView];
    }
    return self;
}

-(void)addOwnsView
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
    HomeJDLayout * layout = [HomeJDLayout new];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120) collectionViewLayout:layout];
    _collectionView.scrollEnabled = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    
    [_collectionView makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(topView.bottom);
        make.width.equalTo(kScreenWidth);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
    }];
    [_collectionView registerClass:[HomeJDCollectionViewCell class] forCellWithReuseIdentifier:@"JDCollectionViewCellID"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderReusableView"]; //注册头部
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterReusableView"]; //注册尾部
}

-(void)setJdDic:(NSDictionary *)jdDic
{
    _jdDic = jdDic;
    [_collectionView reloadData];
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 4;
            break;
    }
    return 1;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"JDCollectionViewCellID";
    //    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    //
    //    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    HomeJDCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
            [cell setImageUrl:_jdDic[@"top_jd"][@"image_url"]];
            break;
        case 1:
            [cell setImageUrl:_jdDic[@"mid_jd"][indexPath.row][@"image_url"]];
            break;
        case 2:
            [cell setImageUrl:_jdDic[@"bottom_jd"][indexPath.row][@"image_url"]];
            break;
        default:
            break;
    }
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
