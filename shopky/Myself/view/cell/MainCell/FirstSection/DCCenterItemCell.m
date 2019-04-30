
//
//  DCCenterItemCell.m
//  CDDStoreDemo
//
//  Created by hao on 2017/12/12.
//Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "DCCenterItemCell.h"

// Controllers

// Models
#import "DCStateItem.h"
// Views
#import "DCStateItemCell.h"
#import "DCStateItemFooterView.h"
#import "orderFlagCollectionViewCell.h"
// Vendors
//#import <MJExtension.h>
// Categories

// Others

@interface DCCenterItemCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;
/* 数据 */
@property (strong , nonatomic)NSMutableArray<DCStateItem *> *stateItem;
@end

static NSString *const DCStateItemCellID = @"orderFlagCollectionViewCell";

static NSString *const DCStateItemFooterViewID = @"DCStateItemFooterView";

@implementation DCCenterItemCell

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *dcFlowLayout = [UICollectionViewFlowLayout new];
        dcFlowLayout.minimumLineSpacing = dcFlowLayout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:dcFlowLayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;

        //注册Cell
//        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DCStateItemCell class]) bundle:nil] forCellWithReuseIdentifier:DCStateItemCellID];
//        orderFlagCollectionViewCell
        
        [_collectionView registerClass:[orderFlagCollectionViewCell class] forCellWithReuseIdentifier:DCStateItemCellID];
        
        //注册footerView
        [_collectionView registerClass:[DCStateItemFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCStateItemFooterViewID];
        
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSMutableArray<DCStateItem *> *)stateItem
{
    if (!_stateItem) {
        _stateItem = [NSMutableArray array];
    }
    return _stateItem;
}

#pragma mark - Intial
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = DCBGColor;
    [self layoutSubviews];
    _stateItem = [DCStateItem mj_objectArrayWithFilename:@"MyCenterFlow.plist"];
    [self.collectionView reloadData];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}


#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _stateItem.count/2;
}


#pragma mark - <UICollectionViewDelegate>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    orderFlagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCStateItemCellID forIndexPath:indexPath];
    if (!cell) {
//        cell = [[orderFlagCollectionViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
//        cell = [[orderFlagCollectionViewCell alloc] initWithStyle: ]
    }
    cell.stateItem = _stateItem[indexPath.row];//赋值
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //传递选择状态
    !_orderBtnClickBlock ? :_orderBtnClickBlock(indexPath.row);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionFooter) {
        DCStateItemFooterView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCStateItemFooterViewID forIndexPath:indexPath];
        reusableView = footer;
    }
    return reusableView;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenW / 5, self.bounds.size.height);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(ScreenW, 0);
}

@end
