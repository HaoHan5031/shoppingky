//
//  HomeJDLayout.m
//  shopky
//
//  Created by HaoMac on 2018/9/5.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeJDLayout.h"

@implementation HomeJDLayout

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
    return CGSizeMake(self.collectionView.bounds.size.width, 480);
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
        case 1:
            [self layoutAttributesForCustomSecondLayout:layoutAttributes indexPath:indexPath];
            break;
        case 2:
            [self layoutAttributesForCustomThirdLayout:layoutAttributes indexPath:indexPath];
            break;
        default:
            break;
    }
    return layoutAttributes;
}



#pragma mark - 自定义第一组section
- (void)layoutAttributesForCustomOneLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    
    if (indexPath.item > 1)return;
    layoutAttributes.frame = CGRectMake(0, 0, kScreenWidth, 150);
    _overallHeight += 150;
}

#pragma mark - 自定义第2组section
- (void)layoutAttributesForCustomSecondLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    
    if (indexPath.item > 4)return;
    CGFloat itemH = 100;
    CGFloat itemW = ScreenW / 2.0;
    
    switch (indexPath.item) {
        case 0:
            layoutAttributes.frame = CGRectMake(0, _overallHeight, itemW, 100);
            break;
        case 1:
            layoutAttributes.frame = CGRectMake(itemW, _overallHeight, itemW, 100);
            break;
        case 2:
        {
            layoutAttributes.frame = CGRectMake(0, itemH+_overallHeight, itemW, 100);
        }
            break;
        case 3:
        {
            layoutAttributes.frame = CGRectMake(itemW, itemH+_overallHeight, itemW, 100);
            _overallHeight += 200;
            break;
        }
        default:
            break;
    }
    
    
}

#pragma mark - 自定义第3组section
- (void)layoutAttributesForCustomThirdLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    
    if (indexPath.item > 4)return;
    CGFloat itemH = 120;
    CGFloat itemW = ScreenW / 4.0;
    
    switch (indexPath.item) {
        case 0:
            layoutAttributes.frame = CGRectMake(0, _overallHeight, itemW, itemH);
            break;
        case 1:
            layoutAttributes.frame = CGRectMake(itemW, _overallHeight, itemW, itemH);
            break;
        case 2:
        {
            
            layoutAttributes.frame = CGRectMake(itemW*2, _overallHeight, itemW, itemH);
        }
            break;
        case 3:
        {
            layoutAttributes.frame = CGRectMake(itemW*3, _overallHeight, itemW, itemH);
            _overallHeight += 120;
            break;
        }
        default:
            break;
    }
    
}

@end
