//
//  HomeYouLikeLayout.m
//  shopky
//
//  Created by HaoMac on 2018/9/6.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeYouLikeLayout.h"

@implementation HomeYouLikeLayout
-(void)prepareLayout
{
    [super prepareLayout];
    [self initAttributes];
    _overallHeight = 0;
}

#pragma mark 初始化Attributes
-(void)initAttributes
{
    NSMutableArray* arrRibutesTop = [NSMutableArray array];
    //    NSMutableArray* arrRibutesMid = [NSMutableArray array];
    //    NSMutableArray* arrRibutesBottom = [NSMutableArray array];
    NSInteger sectionCount = [self.collectionView numberOfSections];
    for (int i = 0; i < sectionCount; i++) {
        //sectionHeader
        NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:i];
        UICollectionViewLayoutAttributes *attrheader = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        [arrRibutesTop addObject:attrheader];
        
        //sectionItem
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < itemCount; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            [arrRibutesTop addObject:attrs];
        }
        //sectionfooter
        UICollectionViewLayoutAttributes *attrFooter = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:indexPath];
        [arrRibutesTop addObject:attrFooter];
    }
    _arrAttributes = [NSMutableArray arrayWithArray:arrRibutesTop];
}

-(CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.bounds.size.width, 800);
}

#pragma mark - 对应indexPath的位置的追加视图的布局属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewLayoutAttributes *layoutAttrbutes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    CGFloat height = 0;
    
    if (elementKind == UICollectionElementKindSectionHeader) { //头部
        height = 0;
    } else { //尾部
        height = 0;
    }
    layoutAttrbutes.frame = CGRectMake(0, self.overallHeight, ScreenW, height);
    
    self.overallHeight += height;
    
    return layoutAttrbutes;
}

#pragma mark - 返回rect中的所有的元素的布局属性
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _arrAttributes;
}


#pragma mark - 返回对应于indexPath的位置的cell的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
            [self layoutAttributesForCustomOneLayout:layoutAttributes indexPath:indexPath];
            break;
        default:
            break;
    }
    return layoutAttributes;
}

- (void)layoutAttributesForCustomOneLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    
    CGFloat itemW = (kScreenWidth - 4) / 2;
    CGFloat itenH = (kScreenWidth - 4) / 2 +40;
//    layoutAttributes.frame = CGRectMake((indexPath.item % 2)*itemW, (indexPath.item / 2)*itenH, itemW, itenH);
    layoutAttributes.frame = CGRectMake((indexPath.item % 2)*itemW, (indexPath.item / 2)*itenH, itemW, itenH);
    CGRect rc = layoutAttributes.frame;
    rc.origin = rc.origin;
}

@end
