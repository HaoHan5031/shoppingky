//
//  CategoryViewController.m
//  shopky
//
//  Created by HaoMac on 2018/8/23.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "CategoryViewController.h"
#import "MovieCollectionViewCell.h"
#import "MovieHeadCollectionReusableView.h"
#import "MoiveFootCollectionReusableView.h"
#import "FLCollectionViewCell.h"
@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *jsonStr = @"123";
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *tempDictQueryDiamond = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSLog(@"%@",tempDictQueryDiamond);
    int i = 0;
    i = i;
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 1;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight- 64) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[MovieCollectionViewCell class] forCellWithReuseIdentifier:@"MovieCollectionViewCellID"];
    [_collectionView registerClass:[MovieHeadCollectionReusableView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MovieCollectionViewCellHeadID"];
    [_collectionView registerClass:[MoiveFootCollectionReusableView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MovieCollectionViewCellFootID"];
    [_collectionView reloadData];
    
    [_collectionView registerClass:[FLCollectionViewCell class] forCellWithReuseIdentifier:@"FLCollectionViewCellID"];
    [_collectionView registerClass:[MovieHeadCollectionReusableView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FLCollectionViewCellHeadID"];
    [_collectionView registerClass:[MoiveFootCollectionReusableView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FLCollectionViewCellFootID"];
    [_collectionView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return MoiveClassArr.count;
    }
    else if(section == 1)
    {
        return MoiveImageArr.count;
    }
    return 0;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString * CellIdentifier = @"MovieCollectionViewCellID";
        
        MovieCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        NSString *groupIamgeUrl = MoiveClassArr[indexPath.row];
        [cell setItemText:groupIamgeUrl];
        return cell;
    }
    else if (indexPath.section == 1)
    {
        static NSString * CellIdentifier = @"FLCollectionViewCellID";
        FLCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        NSString *groupIamgeUrl = MoiveImageArr[indexPath.row];
        [cell setImageName:groupIamgeUrl];
        return cell;
    }
    return nil;
    
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {//9宫格组
        return CGSizeMake(ScreenW/5 , ScreenW/5 );
    }
    else if(indexPath.section == 1)
    {
        return CGSizeMake(ScreenW / 2 - 0.5 , 100);
    }
    return  CGSizeZero;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 1) ? 1 : 0;
}
#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 1) ? 1 : 0;
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
//    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            layoutAttributes.size = CGSizeMake(ScreenW, ScreenW * 0.38);
        }else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
            layoutAttributes.size = CGSizeMake(ScreenW * 0.5, ScreenW * 0.24);
        }else{
            layoutAttributes.size = CGSizeMake(ScreenW * 0.25, ScreenW * 0.35);
        }
    }
    return layoutAttributes;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 0) {
            MovieHeadCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MovieCollectionViewCellHeadID" forIndexPath:indexPath];
            [headView setHeadImage:@"moviehead"];
            reusableview = headView;
            
        }
        else if (indexPath.section == 1)
        {
            MovieHeadCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FLCollectionViewCellHeadID" forIndexPath:indexPath];
            [headView setHeadImage:@"fldy"];
            reusableview = headView;
        }
    }
    if (kind == UICollectionElementKindSectionFooter) {
        if (indexPath.section == 0) {
            MoiveFootCollectionReusableView* footView =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MovieCollectionViewCellFootID" forIndexPath:indexPath];
            reusableview = footView;
        }
        else if (indexPath.section == 1)
        {
            MoiveFootCollectionReusableView* footView =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FLCollectionViewCellFootID" forIndexPath:indexPath];
            reusableview = footView;
        }
        
    }
    
    return reusableview;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0 || section == 1) {
        return CGSizeMake(ScreenW, 200); //图片滚动的宽高
    }
    if (section == 2 || section == 4 || section == 5) {//猜你喜欢的宽高
        return CGSizeMake(ScreenW, 40);  //推荐适合的宽高
    }
    return CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return CGSizeMake(ScreenW, 50);  //Top头条的宽高
    }
    if (section == 3) {
        return CGSizeMake(ScreenW, 80); // 滚动广告
    }
    if (section == 5) {
        return CGSizeMake(ScreenW, 40); // 结束
    }
    return CGSizeZero;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
