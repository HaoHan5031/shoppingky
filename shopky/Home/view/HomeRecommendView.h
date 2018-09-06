//
//  HomeRecommendView.h
//  shopky
//
//  Created by HaoMac on 2018/9/3.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeRecommendView : UIView<SDCycleScrollViewDelegate, UICollectionViewDelegate,
                                        UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong)UIImageView* image_top;
@property(nonatomic, strong)SDCycleScrollView* recSDCycleScrollView;
@property(nonatomic, strong)UICollectionView* recProductCollection;
@property(nonatomic, strong)NSDictionary* dataDic;
@property(nonatomic, strong)NSArray* productArr;
-(void)setDataDic:(NSDictionary *)dataDic;
@end
